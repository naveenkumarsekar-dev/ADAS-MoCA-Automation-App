import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:adas_development/widgets/app_bar/appbar_subtitle.dart';
import 'package:adas_development/widgets/app_bar/custom_app_bar.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CognitiveAssessmentPageOneScreen extends StatelessWidget {
  const CognitiveAssessmentPageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 28.v),
                    child: Column(children: [
                      Container(
                          width: 346.h,
                          margin: EdgeInsets.only(left: 49.h, right: 34.h),
                          child: Text(
                              "Complete all the tests to get your assessment score",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.h),
                          child: _buildNaming(context,
                              namingText: "VISUOSPATIAL / EXECUTIVE",
                              countText: "0/3", onTapNaming: () {
                            onTapNaming(context);
                          })),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.h),
                          child: _buildNaming(context,
                              namingText: "NAMING",
                              countText: "0/3", onTapNaming: () {
                            onTapNaming1(context);
                          })),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.h),
                          child: _buildNaming(context,
                              namingText: "MEMORY",
                              countText: "0/1", onTapNaming: () {
                            onTapNaming2(context);
                          })),
                      SizedBox(height: 19.v),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h, right: 20.h),
                          child: _buildNaming(context,
                              namingText: "ATTENTION",
                              countText: "0/4", onTapNaming: () {
                            onTapNaming3(context);
                          })),
                      SizedBox(height: 25.v),
                      _buildPrice(context),
                      SizedBox(height: 24.v),
                      _buildAbstraction(context),
                      SizedBox(height: 30.v),
                      _buildDelayedRecall(context),
                      SizedBox(height: 19.v),
                      _buildOrientation(context),
                      SizedBox(height: 25.v),
                      _buildFrameSix(context)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgClockBlack9000234x34,
            margin: EdgeInsets.only(left: 30.h, top: 9.v, bottom: 12.v)),
        title: AppbarSubtitle(
            text: "Cognitive Assessment", margin: EdgeInsets.only(left: 38.h)));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Container(
        width: 396.h,
        margin: EdgeInsets.only(left: 20.h, right: 14.h),
        padding: EdgeInsets.symmetric(horizontal: 142.h, vertical: 19.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11.v),
              Text("LANGUAGE", style: CustomTextStyles.titleLarge_2)
            ]));
  }

  /// Section Widget
  Widget _buildAbstraction(BuildContext context) {
    return CustomElevatedButton(
        height: 81.v,
        text: "ABSTRACTION",
        margin: EdgeInsets.only(left: 20.h, right: 14.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLarge_2);
  }

  /// Section Widget
  Widget _buildDelayedRecall(BuildContext context) {
    return CustomElevatedButton(
        height: 81.v,
        text: "DELAYED RECALL",
        margin: EdgeInsets.only(left: 20.h, right: 14.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLarge_2);
  }

  /// Section Widget
  Widget _buildOrientation(BuildContext context) {
    return CustomElevatedButton(
        height: 81.v,
        text: "ORIENTATION",
        margin: EdgeInsets.symmetric(horizontal: 17.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLarge_2);
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return CustomElevatedButton(
        height: 48.v,
        width: 95.h,
        text: "Home",
        margin: EdgeInsets.only(left: 4.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillIndigo,
        buttonTextStyle: CustomTextStyles.titleSmallNunitoIndigo300);
  }

  /// Section Widget
  Widget _buildFrameSix(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
        decoration: AppDecoration.fillBlack,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildHome(context),
          Container(
              height: 48.v,
              width: 279.h,
              padding: EdgeInsets.symmetric(vertical: 12.v),
              decoration: AppDecoration.fillOnErrorContainer,
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center))
        ]));
  }

  /// Common widget
  Widget _buildNaming(
    BuildContext context, {
    required String namingText,
    required String countText,
    Function? onTapNaming,
  }) {
    return GestureDetector(
        onTap: () {
          onTapNaming!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 22.v),
            decoration: AppDecoration.fillPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 141.h, top: 5.v),
                      child: Text(namingText,
                          style: CustomTextStyles.titleLarge_2
                              .copyWith(color: appTheme.black90002))),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 110.h, top: 8.v, bottom: 2.v),
                      child: Text(countText,
                          style: CustomTextStyles.titleLargeRoboto
                              .copyWith(color: appTheme.black90002)))
                ])));
  }

  /// Navigates to the visuospatialPageOneScreen when the action is triggered.
  onTapNaming(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.visuospatialPageOneScreen);
  }

  /// Navigates to the namingPage1Screen when the action is triggered.
  onTapNaming1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.namingPage1Screen);
  }

  /// Navigates to the memoryInstructionPageScreen when the action is triggered.
  onTapNaming2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.memoryInstructionPageScreen);
  }

  /// Navigates to the attentionTwentyfiveScreen when the action is triggered.
  onTapNaming3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.attentionTwentyfiveScreen);
  }
}
