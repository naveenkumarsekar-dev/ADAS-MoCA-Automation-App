import 'package:adas_development/widgets/drawing_area_cube.dart';
import 'package:flutter/material.dart';
import 'package:adas_development/core/app_export.dart';// Import the DrawingArea widget
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
// TO UNDO: AFTER THE CUBE DATASET IS DONE
import 'dart:io'; 
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:adas_development/core/scoring/clock_scoring.dart';
import 'package:adas_development/core/scoring/cube_scoring.dart';


class VisuospatialPageTwoScreen extends StatefulWidget {
  const VisuospatialPageTwoScreen({Key? key}) : super(key: key);

  @override
  _VisuospatialPageTwoScreenState createState() => _VisuospatialPageTwoScreenState();
}

class _VisuospatialPageTwoScreenState extends State<VisuospatialPageTwoScreen> {
  int? score; // Variable to store the score
  GlobalKey<CubeDrawingAreaState> _drawingAreaKey = GlobalKey<CubeDrawingAreaState>();
  // TO UNDO: AFTER CUBE DATASET IS DONE
  late CubeScoringModule _cubeScoringModule;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the score from the arguments
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null && args.containsKey("score")) {
      score = args["score"] as int?;
      print("Score received: $score"); // Debugging purpose
    }
  }
  // TO UNDO: AFTER CUBE DATASET IS DONE
  @override
  void initState() {
    super.initState();
    _cubeScoringModule = CubeScoringModule(); // Initialize the cube scoring module
  }
  void _onImageCaptured(String imagePath) async {

  // TO UNDO: AFTER CUBE DATASET IS DONE
  // // Download the image from Firebase Storage
  File? imageFile = await _downloadImageFile(imagePath);
  print("Image downloaded: ${imageFile?.path}");

  if (imageFile != null) {
    // Use the cube scoring module with the downloaded image file
    int updatedScore = await _cubeScoringModule.predictCube(imageFile, context, score ?? 0);

    // Update the local score
    setState(() {
      score = updatedScore;
    });

    print("Updated Score: $score");
  } else {
    print("Failed to download the image.");
  }
}

// TO UNDO: AFTER CUBE DATASET IS DONE
// Function to download the image file from Firebase Storage
Future<File?> _downloadImageFile(String imagePath) async {
  try {
    // Get the Firebase Storage reference
    final Reference storageRef = FirebaseStorage.instance.ref().child(imagePath);

    // Get the directory to save the downloaded image
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = '${tempDir.path}/temp_image.jpg';
  
    // Download and save the image to a file
    await storageRef.writeToFile(File(tempPath));

    return File(tempPath);
  } catch (e) {
    print("Error downloading image: $e");
    return null;
  }
}

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 41.v),
                child: Column(children: [
                  SizedBox(height: 4.v),
                  _buildClockRow(context),
                  SizedBox(height: 10.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        width: 27.adaptSize,
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnSecondaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("1",
                            style: CustomTextStyles.bodyMediumSecondaryContainer)),
                    Container(
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.v),
                        decoration: AppDecoration.outlineBlack900021.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("2",
                            style: CustomTextStyles.bodyMediumSecondaryContainer)),
                    Container(
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 1.v),
                        decoration: AppDecoration.outlineBlack90002.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("3", style: theme.textTheme.bodyMedium))
                  ]),
                  SizedBox(height: 10.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgImage9,
                      height: 101.v,
                      width: 103.h),
                  SizedBox(height: 10.v),
                  SizedBox(
                      width: 243.h,
                      child: Text(
                          "Copy this drawing as accurately as you can, in the space below",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium_1.copyWith(height: 2.07))),
                  SizedBox(height: 10.v),
                  Container(
                    width:double.infinity, // Uses the entire width of the screen
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Black border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: CubeDrawingArea(
                      key: _drawingAreaKey,
                      onImageCaptured: _onImageCaptured,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  _buildPreviousRow(context)
                ]))));
  }

  Widget _buildClockRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 23.h, right: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              onTap: () {
                onTapBtnClock(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgClockBlack9000234x34)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 11.v, bottom: 8.v),
              child: Text("Visuospatial / Executive",
                  style: theme.textTheme.headlineMedium))
        ]));
  }

  Widget _buildPreviousRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomElevatedButton(
              width: 146.h,
              text: "Previous",
              buttonTextStyle: CustomTextStyles.titleLargeSecondaryContainer_1,
              onPressed: () {
                onTapPrevious(context);
              }),
          CustomElevatedButton(
              width: 146.h,
              text: "Next",
              buttonTextStyle: theme.textTheme.titleSmall!,
              onPressed: () async {
                await _drawingAreaKey.currentState?.captureAndUploadImage();
                onTapNext(context);
              })
        ]));
  }

  void onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageOneScreen);
  }

  void onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageOneScreen);
  }

  /// Navigates to the visuospatialPageThreeScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.visuospatialPageTwoScreen,
      arguments: {"score": score}, // Pass the score as an argument
    );
  }

  
}
