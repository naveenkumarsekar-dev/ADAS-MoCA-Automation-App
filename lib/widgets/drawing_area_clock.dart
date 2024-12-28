// import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
//TO REMOVE:
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:adas_development/core/services/firebase_storage_service.dart';
import 'package:image/image.dart' as img;

class DrawingArea extends StatefulWidget {
  final Function(String) onImageCaptured;
  // TO REMOVE:
  // final List<Offset> numberPositions; // New parameter for number positions
  DrawingArea({required this.onImageCaptured, Key? key}) : super(key: key);
  

  @override
  DrawingAreaState createState() => DrawingAreaState();
}

class DrawingAreaState extends State<DrawingArea> {
  GlobalKey _globalKey = GlobalKey();
  List<Offset?> points = [];
  
  final List<int?> placedNumbers = List.filled(12, null); // To track placed numbers

  // GlobalKey to reference the Stack
  // final GlobalKey _stackKey = GlobalKey(); 
  // Map to store the position of each number
  Map<int, Offset> numberPositions = {};  

  @override
  Widget build(BuildContext context) {
    //TO REMOVE:
    // List<Offset> clockPositions = getClockPositions();
    // Repaint boundary for capturing the image
    return Column(
      children: [
        // Drawing area with clock
        RepaintBoundary(
          key: _globalKey,
          child: ClipRect(
            child: DragTarget<int>(
              // Accept integers (or any type) representing dragged numbers
              onAcceptWithDetails: (details) {
                setState(() {
                  // Convert global position to local position
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  Offset localPosition = renderBox.globalToLocal(details.offset);
                  numberPositions[details.data] = localPosition;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox renderBox = context.findRenderObject() as RenderBox;
                    Offset localPosition = renderBox.globalToLocal(details.globalPosition);

                    if (localPosition.dx >= 0 &&
                        localPosition.dx <= renderBox.size.width &&
                        localPosition.dy >= 0 &&
                        localPosition.dy <= renderBox.size.height) {
                      setState(() {
                        points.add(localPosition);
                      });
                    }
                  },
                  onPanEnd: (details) {
                    points.add(null);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter: MyPainter(points),
                        size: Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.49,
                        ),
                      ),
                      // Display placed numbers
                      ...numberPositions.entries.map((entry) {
                        return Positioned(
                          left: entry.value.dx,
                          top: entry.value.dy,
                          child: Text(entry.key.toString(), style: TextStyle(fontSize: 30)),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
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
      // Convert ByteData to Uint8List for processing
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Decode PNG to an Image object from the image package
      img.Image? decodedImage = img.decodePng(pngBytes);

      if (decodedImage != null) {
        // Re-encode the image to JPG format
        Uint8List jpgBytes = Uint8List.fromList(img.encodeJpg(decodedImage));

        // Upload the JPG bytes to Firebase Storage
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
     // Generate a unique filename using the current timestamp
    // String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    // String uniqueFileName = 'clock_class_three/drawing_$timestamp.jpg';
    // Generate a sequential filename using SharedPreferences
    String uniqueFileName = await generateSequentialFileName();

    // Specify the path within Firebase Storage
    String downloadUrl = await storageService.uploadImageData(imageData, uniqueFileName);
    print("Image uploaded successfully. Download URL: $downloadUrl");
    // TO DECREMENT THE CURRENTCOUNT VALUE BY 1
    // await decrementImageCount()

    // TO PREDICT THE CLOCK SCORE
    widget.onImageCaptured(uniqueFileName);
  } catch (e) {
    print("Error uploading image to Firebase: $e");
  }
}

}
// Function to generate a unique, sequential file name
Future<String> generateSequentialFileName() async {
  final prefs = await SharedPreferences.getInstance();
  
  // Retrieve the current image count or start from 1 if it doesn't exist
  int currentCount = prefs.getInt('image_count') ?? 1;
  
  // Generate the file name using the current count
  String uniqueFileName = 'uploads/capstone/clock_$currentCount.jpg';
  
  // Increment the count and save it for the next image
  await prefs.setInt('image_count', currentCount + 1);
  // print(currentCount);
  
  return uniqueFileName;
}
// TO DECREMENT THE CURRENTCOUNT VALUE BY 1
// // Function to decrement the image count
// Future<void> decrementImageCount() async {
//   final prefs = await SharedPreferences.getInstance();
  
//   // Retrieve the current count, defaulting to 1 if not found
//   int currentCount = prefs.getInt('image_count') ?? 1;
  
//   // Only decrement if currentCount is greater than 1
//   if (currentCount > 1) {
//     await prefs.setInt('image_count', currentCount - 1);
//   }
//   print(currentCount);
// }


class MyPainter extends CustomPainter {
  List<Offset?> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    // Fill the background with white
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = Colors.white);
    // Set up the paint for drawing lines
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
