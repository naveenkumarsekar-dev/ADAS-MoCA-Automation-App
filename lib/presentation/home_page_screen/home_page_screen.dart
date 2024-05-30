import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 46.v),
              child: Column(children: [
                SizedBox(height: 9.v),
                _buildHomePageRow(context),
                SizedBox(height: 20.v),
                Text("Hello ",
                    style: CustomTextStyles.headlineMediumOnPrimaryContainer),
                Text("Tomy",
                    style: CustomTextStyles
                        .headlineLargePoppinsOnPrimaryContainer),
                SizedBox(height: 38.v),
                _buildCalendarRow(context),
                SizedBox(height: 18.v),
                Container(
                    height: 428.v,
                    width: 360.h,
                    decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(31.h)))
              ])),
        ),
        bottomNavigationBar: _buildFrameSixRow(context));
  }

  /// Section Widget
  Widget _buildHomePageRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 68.v,
              width: 71.h,
              margin: EdgeInsets.symmetric(vertical: 6.v),
              decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                  borderRadius: BorderRadius.circular(35.h))),
          Spacer(flex: 43),
          CustomImageView(
              imagePath: ImageConstant.imgAdasHighResol,
              height: 80.v,
              width: 107.h),
          Spacer(flex: 56),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: Column(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgTelevision,
                    height: 32.v,
                    width: 36.h,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 1.h),
                    onTap: () {
                      onTapImgTelevision(context);
                    }),
                SizedBox(height: 8.v),
                Text("Logout", style: theme.textTheme.bodyMedium)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildCalendarRow(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapCalendarRow(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 3.h),
            padding: EdgeInsets.symmetric(vertical: 17.v),
            decoration: AppDecoration.fillPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgCalendar,
                      height: 63.v,
                      width: 57.h),
                  Padding(
                      padding: EdgeInsets.only(top: 19.v, bottom: 9.v),
                      child: Text("Cognitive Assessment",
                          style: CustomTextStyles.headlineMediumBlack90002))
                ])));
  }

  /// Section Widget
  Widget _buildFrameSixRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 16.v),
        decoration: AppDecoration.fillBlack,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                  height: 48.v,
                  width: 95.h,
                  text: "Home",
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 8.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgUser,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  buttonStyle: CustomButtonStyles.fillIndigo,
                  buttonTextStyle: CustomTextStyles.titleSmallNunitoIndigo300),
              Container(
                  height: 48.v,
                  width: 275.h,
                  margin: EdgeInsets.only(left: 12.h),
                  padding: EdgeInsets.symmetric(vertical: 12.v),
                  decoration: AppDecoration.fillOnErrorContainer,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.center))
            ]));
  }

  /// Navigates to the signInOneScreen when the action is triggered.
  onTapImgTelevision(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInOneScreen);
  }

  /// Navigates to the cognitiveAssessmentPageOneScreen when the action is triggered.
  onTapCalendarRow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cognitiveAssessmentPageOneScreen);
  }
}
