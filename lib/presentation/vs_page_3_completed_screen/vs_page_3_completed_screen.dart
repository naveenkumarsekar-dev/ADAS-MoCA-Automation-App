import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class VsPage3CompletedScreen extends StatelessWidget {
  const VsPage3CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
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
                              horizontal: 7.h, vertical: 2.v),
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
                    SizedBox(
                        height: 506.v,
                        width: 374.h,
                        child: Stack(alignment: Alignment.bottomRight, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 61.h, vertical: 77.v),
                                  decoration: AppDecoration.fillBlueGray.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder50),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 41.v),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgGroup98,
                                            height: 307.v,
                                            width: 250.h)
                                      ]))),
                          CustomImageView(
                              imagePath: ImageConstant.imgCharmCross,
                              height: 34.adaptSize,
                              width: 34.adaptSize,
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(right: 113.h)),
                          CustomImageView(
                              imagePath: ImageConstant.imgFaSolidEraser,
                              height: 32.adaptSize,
                              width: 32.adaptSize,
                              alignment: Alignment.bottomCenter),
                          CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              height: 26.adaptSize,
                              width: 26.adaptSize,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 130.h, bottom: 3.v))
                        ])),
                    SizedBox(height: 33.v),
                    _buildPreviousRow(context)
                  ]))),
        ));
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
              onPressed: () {
                onTapFinish(context);
              })
        ]));
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  /// Navigates to the vsPage2CompletedScreen when the action is triggered.
  onTapPrevious(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.vsPage2CompletedScreen);
  }

  /// Navigates to the cognitiveAssessmentPageScreen when the action is triggered.
  onTapFinish(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageScreen);
  }
}
