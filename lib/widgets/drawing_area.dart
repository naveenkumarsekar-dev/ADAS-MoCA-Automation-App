import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawingArea extends StatefulWidget {
  final Function(ByteData) onImageCaptured;

  DrawingArea({required this.onImageCaptured, Key? key}) : super(key: key);
  @override
  DrawingAreaState createState() => DrawingAreaState();
}

class DrawingAreaState extends State<DrawingArea> {
  GlobalKey _globalKey = GlobalKey();
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          points.add(renderBox.globalToLocal(details.globalPosition));
        });
      },
      onPanEnd: (details) {
        points.add(null);
      },
      child: RepaintBoundary(
        key: _globalKey,
        child: Stack(
          children: [
            CustomPaint(
              painter: MyPainter(points),
              size: Size.infinite,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> captureImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    if (byteData != null) {
      widget.onImageCaptured(byteData);
    }
  }
}

class MyPainter extends CustomPainter {
  List<Offset?> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
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
