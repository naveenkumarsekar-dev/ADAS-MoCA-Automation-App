import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adas_development/core/services/firebase_storage_service.dart';
import 'package:image/image.dart' as img;

class CubeDrawingArea extends StatefulWidget {
  final Function(String) onImageCaptured;

  CubeDrawingArea({required this.onImageCaptured, Key? key}) : super(key: key);

  @override
  CubeDrawingAreaState createState() => CubeDrawingAreaState();
}

class CubeDrawingAreaState extends State<CubeDrawingArea> {
  GlobalKey _globalKey = GlobalKey();
  List<Map<String, dynamic>> points = []; // Stores points with additional metadata
  List<List<Map<String, dynamic>>> pointsHistory = []; // Stack to store canvas states for undo
  List<List<Map<String, dynamic>>> redoStack = []; // Stack to store canvas states for redo
  bool isErasing = false;
  double eraserThickness = 10.0; // Current thickness for the eraser
  double pendingEraserThickness = 10.0; // Slider value for the next eraser stroke

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: GestureDetector(
                  onPanStart: (details) {
                    // Save current state for undo and clear redo stack
                    pointsHistory.add(List.from(points));
                    redoStack.clear();

                    if (isErasing) {
                      setState(() {
                        eraserThickness = pendingEraserThickness;
                      });
                    }
                  },
                  onPanUpdate: (details) {
                    RenderBox renderBox = context.findRenderObject() as RenderBox;
                    Offset localPosition = renderBox.globalToLocal(details.globalPosition);

                    if (localPosition.dx >= 0 &&
                        localPosition.dx <= renderBox.size.width &&
                        localPosition.dy >= 0 &&
                        localPosition.dy <= renderBox.size.height) {
                      setState(() {
                        points.add({
                          "offset": localPosition,
                          "isErasing": isErasing,
                          "thickness": isErasing ? eraserThickness : 5.0, // Store thickness
                        });
                      });
                    }
                  },
                  onPanEnd: (details) {
                    // Add a null point to mark the end of a stroke
                    points.add({
                      "offset": null,
                      "isErasing": false,
                      "thickness": 0.0, // Default thickness for null points
                    });
                  },
                  child: CustomPaint(
                    painter: MyPainter(points),
                    size: Size.infinite,
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.undo, color: pointsHistory.isNotEmpty ? Colors.blue : Colors.grey),
                      onPressed: pointsHistory.isNotEmpty
                          ? () {
                              setState(() {
                                redoStack.add(List.from(points)); // Save current state for redo
                                points = pointsHistory.removeLast(); // Restore the previous state
                              });
                            }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.redo, color: redoStack.isNotEmpty ? Colors.blue : Colors.grey),
                      onPressed: redoStack.isNotEmpty
                          ? () {
                              setState(() {
                                pointsHistory.add(List.from(points)); // Save current state for undo
                                points = redoStack.removeLast(); // Restore the next state
                              });
                            }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.create, color: isErasing ? Colors.grey : Colors.blue),
                      onPressed: () {
                        setState(() {
                          isErasing = false; // Switch to pen mode
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.cleaning_services, color: isErasing ? Colors.blue : Colors.grey),
                      onPressed: () {
                        setState(() {
                          isErasing = true; // Switch to eraser mode
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          points.clear(); // Clear all points from the canvas
                          pointsHistory.clear(); // Clear history
                          redoStack.clear(); // Clear redo history
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (isErasing)
                Positioned(
                  bottom: 20.0,
                  left: 10.0,
                  right: 10.0,
                  child: Column(
                    children: [
                      Text("Eraser Thickness: ${pendingEraserThickness.toStringAsFixed(1)}"),
                      Slider(
                        value: pendingEraserThickness,
                        min: 5.0,
                        max: 50.0,
                        onChanged: (value) {
                          setState(() {
                            pendingEraserThickness = value; // Update thickness for future strokes
                          });
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> captureAndUploadImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();

        img.Image? decodedImage = img.decodePng(pngBytes);

        if (decodedImage != null) {
          Uint8List jpgBytes = Uint8List.fromList(img.encodeJpg(decodedImage));

          await uploadToFirebase(jpgBytes);
        }
      }
    } catch (e) {
      print("Error capturing and uploading image: $e");
    }
  }

  Future<void> uploadToFirebase(Uint8List imageData) async {
    try {
      FirebaseStorageService storageService = FirebaseStorageService();
      String uniqueFileName = await generateSequentialFileName();
      String downloadUrl = await storageService.uploadImageData(imageData, uniqueFileName);
      print("Image uploaded successfully. Download URL: $downloadUrl");

      widget.onImageCaptured(uniqueFileName);
    } catch (e) {
      print("Error uploading image to Firebase: $e");
    }
  }
}

Future<String> generateSequentialFileName() async {
  final prefs = await SharedPreferences.getInstance();
  int currentCount = prefs.getInt('image_count') ?? 78;
  String uniqueFileName = 'uploads/capstone/cube_frd_1/cube_$currentCount.jpg'; // TO CHANGE: CUBE_0 WHEN BUILD THE APK FOR NON-CUBE DATASET
  await prefs.setInt('image_count', currentCount + 1);
  return uniqueFileName;
}

class MyPainter extends CustomPainter {
  List<Map<String, dynamic>> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = Colors.white);

    Paint paint = Paint()
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i]["offset"] != null && points[i + 1]["offset"] != null) {
        paint.color = points[i]["isErasing"] ? Colors.white : Colors.black;
        paint.strokeWidth = points[i]["thickness"] ?? 5.0; // Use stored thickness or default
        canvas.drawLine(points[i]["offset"], points[i + 1]["offset"], paint);
      } else if (points[i]["offset"] != null && points[i + 1]["offset"] == null) {
        paint.color = points[i]["isErasing"] ? Colors.white : Colors.black;
        paint.strokeWidth = points[i]["thickness"] ?? 5.0; // Use stored thickness or default
        canvas.drawPoints(PointMode.points, [points[i]["offset"]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
