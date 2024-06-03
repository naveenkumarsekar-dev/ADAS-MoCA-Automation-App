import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class ClockScoringModule {
  late Interpreter _interpreter;

  ClockScoringModule() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset('clock_model.tflite');
  }

  Future<double> predictClock(Uint8List imageBytes) async{
    // Convert the image to the required input format for the model
    var input = _processImage(imageBytes);

    // Define the output buffer
    var output = List<double>.filled(1, 0).reshape([1, 1]);

    // Run the model
    _interpreter.run(input, output);

    return output[0][0];
  }

  List<List<List<List<double>>>> _processImage(Uint8List imageBytes) {
    // Load the image
    img.Image? image = img.decodeImage(imageBytes);

    // Resize the image to the model's input size (e.g., 224x224)
    img.Image resizedImage = img.copyResize(image!, width: 224, height: 224);

    // Normalize the pixel values to the range [-1, 1]
    List<List<List<List<double>>>> input = List.generate(
      1,
      (i) => List.generate(
        224,
        (i) => List.generate(224, (j) => List.filled(3, 0.0)),
      ),
    );

    for (int y = 0; y < 224; y++) {
      for (int x = 0; x < 224; x++) {
        var pixel = resizedImage.getPixel(x, y);
        input[0][y][x][0] = (img.getLuminance(pixel) / 255.0 - 0.5) * 2;
      }
    }

    return input;
  }

  int getRed(int color) {
    return (color >> 16) & 0xFF;
  }

  int getGreen(int color) {
    return (color >> 8) & 0xFF;
  }

  int getBlue(int color) {
    return color & 0xFF;
  }
}
