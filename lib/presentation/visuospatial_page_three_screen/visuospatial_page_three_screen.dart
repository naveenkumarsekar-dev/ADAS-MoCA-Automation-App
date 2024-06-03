import 'dart:typed_data';
import 'package:adas_development/core/scoring/clock_scoring_module.dart';
import 'package:flutter/material.dart';
import 'package:adas_development/core/app_export.dart'; // Import the DrawingArea widget
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:adas_development/core/services/firebase_storage_service.dart';

class VisuospatialPageThreeScreen extends StatefulWidget {
  const VisuospatialPageThreeScreen({Key? key}) : super(key: key);

  @override
  _VisuospatialPageThreeScreenState createState() =>
      _VisuospatialPageThreeScreenState();
}

class _VisuospatialPageThreeScreenState extends State<VisuospatialPageThreeScreen> {
  GlobalKey<DrawingAreaState> _drawingAreaKey = GlobalKey<DrawingAreaState>();
  late ClockScoringModule _clockScoringModule;
  // final FirebaseStorageService _firebaseStorageService = FirebaseStorageService();

  @override
  void initState() {
    super.initState();
    _clockScoringModule = ClockScoringModule(); // Initialize the clock scoring module
  }

  void _onImageCaptured(ByteData imageBytes) async {
    // Convert ByteData to Uint8List
    Uint8List imageUint8List = imageBytes.buffer.asUint8List();

    // Use the clock scoring module
    double prediction = await _clockScoringModule.predictClock(imageUint8List);
    int score = prediction > 0.5 ? 3 : 0;
    print('score:$score');

    // // Upload the image to Firebase
    // String path = 'images/clock_${DateTime.now().millisecondsSinceEpoch}.png';
    // String imageUrl =
    //     await _firebaseStorageService.uploadImage(imageUint8List, path);

    // if (imageUrl.isNotEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Image uploaded successfully. Score: $score')),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed to upload image.')),
    //   );
    // }
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
                  SizedBox(height: 56.v),
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
                  SizedBox(height: 43.v),
                  SizedBox(
                      width: 265.h,
                      child: Text(
                          "Draw a clock. Put in all the numbers and set the time to 10 past 11",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium_1
                              .copyWith(height: 2.07))),
                  SizedBox(height: 7.v),
                  Expanded(
                      child: DrawingArea(
                    key: _drawingAreaKey,
                    onImageCaptured: _onImageCaptured,
                  )),
                  SizedBox(height: 33.v),
                  _buildPreviousRow(context),
                ]))));
  }

  /// Section Widget
  Widget _buildClockRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 21.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              onTap: () {
                onTapBtnClock(context);
              },
              child:
                  CustomImageView(imagePath: ImageConstant.imgClockBlack90002)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 11.v, bottom: 8.v),
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
              await _drawingAreaKey.currentState?.captureImage();
              onTapFinish(context);
            },
          )
        ]));
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  /// Navigates to the cognitiveAssessmentPageScreen when the action is triggered.
  onTapFinish(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageScreen);
  }

  /// Navigates to the visuospatialPageTwoScreen when the action is triggered.
  onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageTwoScreen);
  }
}
