import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
import 'package:flutter/material.dart';

class CubeScoringModule {
  late Interpreter _interpreter;

  // Constructor to initialize and load the model
  CubeScoringModule() {
    _loadModel();
  }

  // Load the TFLite model using tflite_flutter
  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/cube_model.tflite');//AFTER CUBE DATASET IS DONE , GIVE TO ACTUAL CUBE MODEL
  }

 Future<int> predictCube(File imageFile, BuildContext context, int score) async {
  // Ensure model is loaded
  await _loadModel();

  // Process the image to fit the model input requirements
  var input = await _processImage(imageFile);

  // Define the output structure based on model output requirements
  var output = List<List<double>>.filled(1, List<double>.filled(1, 0.0));

  // Run the model
  _interpreter.run(input, output);

  // Interpret the result
  double confidence = output[0][0];
  int points = confidence > 0.6 ? 3 : 0; // Add 3 points if confidence > 0.6
  score += points; // Increment the score

  // Show the result
  showResultDialog(context, "Prediction confidence: $confidence\nPoints: $points\nUpdated Score: $score");

  // Clean up the temporary file after processing
  await cleanupTemporaryFiles(imageFile.path);

  return score; // Return the updated score
}


  // Image processing: resize and normalize the image for the model
  Future<List<List<List<List<double>>>>> _processImage(File imageFile) async {
    final imageBytes = await imageFile.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);

    // Resize image to 224x224
    img.Image resizedImage = img.copyResize(image!, width: 224, height: 224);

    // Create input tensor with batch size of 1
    List<List<List<List<double>>>> input = List.generate(
      1, // Batch size
      (b) => List.generate(
        224, // Height
        (y) => List.generate(224, (x) {
          // Get pixel value and normalize
          final pixel = resizedImage.getPixel(x, y);
          double red = (pixel.r / 127.5) - 1.0;
          double green = (pixel.g / 127.5) - 1.0;
          double blue = (pixel.b / 127.5) - 1.0;

          // Return the normalized RGB values as a list
          return [red, green, blue];
        }),
      ),
    );

    return input;
  }

  Future<void> cleanupTemporaryFiles(String tempPath) async {
    try {
      final file = File(tempPath);
      if (await file.exists()) {
        await file.delete();
        print("Temporary file deleted: $tempPath");
      }
    } catch (e) {
      print("Error deleting temporary file: $e");
    }
  }

  void showResultDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Prediction Result"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
