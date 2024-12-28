import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class VsPage1CompletedScreen extends StatelessWidget {
  const VsPage1CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 41.v),
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
                        decoration: AppDecoration.outlineBlack90002.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("2", style: theme.textTheme.bodyMedium)),
                    Container(
                        width: 27.adaptSize,
                        margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.h, vertical: 2.v),
                        decoration: AppDecoration.outlineBlack90002.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Text("3", style: theme.textTheme.bodyMedium))
                  ]),
                  SizedBox(height: 18.v),
                  Container(
                      width: 400.h,
                      margin: EdgeInsets.only(left: 13.h),
                      child: Text(
                          "Please draw a line, going from a number\nto a letter in ascending order. Begin here [point to (1)] and draw a line from 1 then to A\nthen to 2 and so on. End here [point to (E)]",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium_1
                              .copyWith(height: 2.07))),
                  SizedBox(height: 17.v),
                  _buildOneStack(context),
                  Spacer(),
                  CustomElevatedButton(
                      width: 146.h,
                      text: "Next",
                      margin: EdgeInsets.only(right: 10.h),
                      buttonTextStyle: theme.textTheme.titleSmall!,
                      onPressed: () {
                        onTapNext(context);
                      },
                      alignment: Alignment.centerRight)
                ]))));
  }

  /// Section Widget
  Widget _buildClockRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 34.h, right: 31.h),
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
  Widget _buildOneStack(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: appTheme.gray200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Container(
            height: 374.v,
            width: 383.h,
            padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 21.v),
            decoration: AppDecoration.fillGray200
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
            child: Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 59.h, top: 141.v, right: 206.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text("1", style: theme.textTheme.headlineSmall)
                          ]))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 4.h, top: 75.v, right: 261.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text("5", style: theme.textTheme.headlineSmall)
                          ]))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 56.h, right: 209.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Text("E", style: theme.textTheme.headlineSmall))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 59.h, right: 206.h, bottom: 4.v),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Text("C", style: theme.textTheme.headlineSmall))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 4.h, right: 261.h, bottom: 76.v),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 17.h),
                                child: SizedBox(
                                    height: 101.v,
                                    child: VerticalDivider(
                                        width: 3.h,
                                        thickness: 3.v,
                                        color: appTheme.black90001))),
                            Container(
                                width: 40.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 1.v),
                                decoration: AppDecoration.fillBlack.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder20),
                                child: Text("D",
                                    style: theme.textTheme.headlineSmall))
                          ]))),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 165.h, top: 131.v, right: 100.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Text("B", style: theme.textTheme.headlineSmall))),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 165.h, top: 20.v, right: 100.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Text("A", style: theme.textTheme.headlineSmall))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 145.h, right: 120.h, bottom: 86.v),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text("4", style: theme.textTheme.headlineSmall)
                          ]))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 265.h, bottom: 56.v),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.h, vertical: 1.v),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text("3", style: theme.textTheme.headlineSmall)
                          ]))),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 265.h, top: 101.v),
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      decoration: AppDecoration.fillBlack.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 3.v),
                            Text("2", style: theme.textTheme.headlineSmall)
                          ]))),
              CustomImageView(
                  imagePath: ImageConstant.imgSettings,
                  height: 90.v,
                  width: 80.h,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 89.h, top: 53.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgSettingsBlack90001,
                  height: 56.v,
                  width: 70.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 49.v, right: 32.h)),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(top: 142.v),
                      child: SizedBox(
                          width: 102.h,
                          child: Divider(
                              color: appTheme.black90001, endIndent: 18.h)))),
              CustomImageView(
                  imagePath: ImageConstant.imgSettingsBlack9000167x85,
                  height: 67.v,
                  width: 85.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 26.h, bottom: 96.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrow5,
                  height: 36.v,
                  width: 170.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 36.h, bottom: 26.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 50.v,
                  width: 61.h,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 89.h, bottom: 41.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrow7,
                  height: 8.v,
                  width: 101.h,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 44.h, bottom: 98.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftBlack90001,
                  height: 41.v,
                  width: 31.h,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 32.h, top: 36.v))
            ])));
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }

  /// Navigates to the visuospatialPageTwoScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageTwoScreen);
  }
}
