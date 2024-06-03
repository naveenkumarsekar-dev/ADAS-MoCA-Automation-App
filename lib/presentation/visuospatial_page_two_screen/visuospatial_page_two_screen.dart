import 'dart:typed_data';
import 'package:adas_development/core/scoring/clock_scoring_module.dart';
import 'package:flutter/material.dart';
import 'package:adas_development/core/app_export.dart';// Import the DrawingArea widget
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';

class VisuospatialPageTwoScreen extends StatefulWidget {
  const VisuospatialPageTwoScreen({Key? key}) : super(key: key);

  @override
  _VisuospatialPageTwoScreenState createState() => _VisuospatialPageTwoScreenState();
}

class _VisuospatialPageTwoScreenState extends State<VisuospatialPageTwoScreen> {
  GlobalKey<DrawingAreaState> _drawingAreaKey = GlobalKey<DrawingAreaState>();
  late ClockScoringModule _clockScoringModule;

  @override
  void initState() {
    super.initState();
    _clockScoringModule = ClockScoringModule(); // Initialize the clock scoring module
  }

  void _onImageCaptured(ByteData imageBytes) async{
    // Convert ByteData to Uint8List
    Uint8List imageUint8List = imageBytes.buffer.asUint8List();

    // Use the clock scoring module
    double prediction = await _clockScoringModule.predictClock(imageUint8List);
    int score = prediction > 0.5 ? 3 : 0;

    print('Score: $score');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Score: $score')),
    );
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
                  SizedBox(height: 48.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgImage9,
                      height: 101.v,
                      width: 103.h),
                  SizedBox(height: 26.v),
                  SizedBox(
                      width: 243.h,
                      child: Text(
                          "Copy this drawing as accurately as you can, in the space below",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium_1.copyWith(height: 2.07))),
                  SizedBox(height: 22.v),
                  Expanded(
                    child: DrawingArea(
                      key: _drawingAreaKey,
                      onImageCaptured: _onImageCaptured,
                    ),
                  ), // Add drawing area here
                  SizedBox(height: 30.v),
                  _buildPreviousRow(context)
                ]))));
  }

  Widget _buildClockRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 23.h, right: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              onTap: () {
                onTapBtnClock(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgClockBlack90002)),
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
                // await _drawingAreaKey.currentState?.captureImage();
                onTapNext(context);
              })
        ]));
  }

  void onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  void onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vsPage1CompletedScreen);
  }

  void onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageThreeScreen);
  }

  
}
