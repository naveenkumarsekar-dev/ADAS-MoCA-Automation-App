import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class VisuospatialPageTwoScreen extends StatelessWidget {
  const VisuospatialPageTwoScreen({Key? key}) : super(key: key);

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
                        decoration: AppDecoration.outlineBlack90002.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("3", style: theme.textTheme.bodyMedium))
                  ]),
                  SizedBox(height: 48.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgClock,
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
                          style: CustomTextStyles.bodyMedium_1
                              .copyWith(height: 2.07))),
                  SizedBox(height: 22.v),
                  // _buildMingcutePencilFillRow(context),
                  Expanded(child: DrawingArea()),// Added drawing area here
                  SizedBox(height: 30.v),
                  _buildPreviousRow(context)
                ]))));
  }

  /// Section Widget
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
              child:
                  CustomImageView(imagePath: ImageConstant.imgClockBlack90002)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 11.v, bottom: 8.v),
              child: Text("Visuospatial / Executive",
                  style: theme.textTheme.headlineMedium))
        ]));
  }

  /// Section Widget
  Widget _buildMingcutePencilFillRow(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapMingcutePencilFillRow(context);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 105.h, vertical: 2.v),
            decoration: AppDecoration.fillBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder50),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgMingcutePencilFill,
                      height: 35.adaptSize,
                      width: 35.adaptSize,
                      margin: EdgeInsets.only(left: 29.h, top: 323.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgFaSolidEraser,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      margin:
                          EdgeInsets.only(left: 17.h, top: 323.v, bottom: 1.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCharmCross,
                      height: 34.adaptSize,
                      width: 34.adaptSize,
                      margin:
                          EdgeInsets.only(left: 17.h, top: 323.v, bottom: 1.v))
                ])));
  }

  /// Section Widget
  Widget _buildPreviousRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.h),
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
              text: "Next",
              buttonTextStyle: theme.textTheme.titleSmall!,
              onPressed: () {
                onTapNext(context);
              })
        ]));
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  /// Navigates to the vsPage2CompletedScreen when the action is triggered.
  onTapMingcutePencilFillRow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vsPage2CompletedScreen);
  }

  /// Navigates to the vsPage1CompletedScreen when the action is triggered.
  onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vsPage1CompletedScreen);
  }

  /// Navigates to the visuospatialPageThreeScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageThreeScreen);
  }
}
