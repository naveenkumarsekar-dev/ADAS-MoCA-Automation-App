import 'package:adas_development/widgets/draggable_numbers.dart';
import 'package:flutter/material.dart';
import 'package:adas_development/core/scoring/clock_scoring.dart';
import 'package:adas_development/core/app_export.dart'; // Import the DrawingArea widget
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class VisuospatialPageThreeScreen extends StatefulWidget {
  const VisuospatialPageThreeScreen({Key? key}) : super(key: key);

  @override
  _VisuospatialPageThreeScreenState createState() =>
      _VisuospatialPageThreeScreenState();
}

class _VisuospatialPageThreeScreenState
    extends State<VisuospatialPageThreeScreen> {
  GlobalKey<DrawingAreaState> _drawingAreaKey = GlobalKey<DrawingAreaState>();
  late ClockScoringModule _clockScoringModule;
  int? score; // Variable to store the score

  @override
  void initState() {
    super.initState();
    _clockScoringModule =
        ClockScoringModule(); // Initialize the clock scoring module
  }
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

  void _onImageCaptured(String imagePath) async {
  // Download the image from Firebase Storage
  File? imageFile = await _downloadImageFile(imagePath);
  print("Image downloaded: ${imageFile?.path}");

  if (imageFile != null) {
    // Use the clock scoring module with the downloaded image file
    int updatedScore = await _clockScoringModule.predictClock(imageFile, context, score ?? 0);

    // Update the local score
    setState(() {
      score = updatedScore;
    });

    print("Updated Score: $score");
  } else {
    print("Failed to download the image.");
  }
}


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
                  SizedBox(height: 6.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        width: 27.adaptSize,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnSecondaryContainer
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder12),
                        child: Text("1",
                            style:
                                CustomTextStyles.bodyMediumSecondaryContainer)),
                    Container(
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.h, vertical: 1.v),
                        decoration: AppDecoration.outlineBlack900021.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("2",
                            style:
                                CustomTextStyles.bodyMediumSecondaryContainer)),
                    Container(
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.h, vertical: 1.v),
                        decoration: AppDecoration.outlineBlack900021.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("3",
                            style:
                                CustomTextStyles.bodyMediumSecondaryContainer))
                  ]),
                  SizedBox(height: 13.v),
                  SizedBox(
                      width: 300.h,
                      child: Text(
                          "Draw a clock. Put in all the numbers and draw the hour and minute hands to 11:10",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium_1
                              .copyWith(height: 2.07))),
                  SizedBox(height: 7.v),
                  Container(
                    child: DraggableNumbers(),
                  ),
                  SizedBox(height: 7.v),
                  Container(
                    width:double.infinity, // Uses the entire width of the screen
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Black border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: DrawingArea(
                      key: _drawingAreaKey,
                      onImageCaptured: _onImageCaptured,
                    ),
                  ),
                  // Sized Box
                  SizedBox(height: 5.v),
                  _buildPreviousRow(context),
                ]))));
  }
  
  /// Section Widget
  Widget _buildClockRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h, right: 21.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              onTap: () {
                onTapBtnClock(context);
              },
              child:
                  CustomImageView(imagePath: ImageConstant.imgClockBlack9000234x34)
                  ),
          Padding(
              padding: EdgeInsets.only(left: 5.h, top: 11.v, bottom: 8.v),
              child: Text("Visuospatial / Executive",
                  style: theme.textTheme.headlineMedium))
        ]));
  }

  /// Section Widget
  Widget _buildPreviousRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomElevatedButton(
              width: 146.h,
              text: "Previous",
              buttonTextStyle: CustomTextStyles.titleLargeSecondaryContainer_1,
              onPressed: () {
                onTapPrevious(context);
              }),
          CustomElevatedButton(
            width: 146.h,
            text: "Finish",
            buttonTextStyle: theme.textTheme.titleSmall!,
            onPressed: () async {
              await _drawingAreaKey.currentState?.captureAndUploadImage();
              onTapFinish(context);
            },
          )
        ]));
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageTwoScreen);
  }

  /// Navigates to the cognitiveAssessmentPageScreen when the action is triggered.
  onTapFinish(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  /// Navigates to the visuospatialPageTwoScreen when the action is triggered.
  onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageTwoScreen);
  }
}
