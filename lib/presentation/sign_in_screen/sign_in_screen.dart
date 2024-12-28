import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:adas_development/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray300,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 39.v),
                            child: Column(children: [
                              Spacer(),
                              CustomImageView(
                                  imagePath: ImageConstant.imgAdasHighResol,
                                  height: 80.v,
                                  width: 107.h),
                              SizedBox(height: 47.v),
                              Text("Welcome back you’ve been missed!",
                                  style: theme.textTheme.bodyLarge),
                              SizedBox(height: 44.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 37.h),
                                  child: CustomTextFormField(
                                      controller: emailController,
                                      hintText: "naveen@gmail.com",
                                      textInputType: TextInputType.emailAddress,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.h, vertical: 21.v))),
                              SizedBox(height: 15.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 37.h),
                                  child: CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "**********",
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.h, vertical: 21.v))),
                              SizedBox(height: 17.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 37.h),
                                      child: Text("Forgot Password?",
                                          style: theme.textTheme.bodyLarge))),
                              SizedBox(height: 12.v),
                              CustomElevatedButton(
                                  height: 66.v,
                                  text: "Sign In",
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 37.h),
                                  buttonStyle: CustomButtonStyles.fillBlack,
                                  buttonTextStyle: CustomTextStyles
                                      .titleMediumSecondaryContainer,
                                  onPressed: () {
                                    onTapSignIn(context);
                                  }),
                              SizedBox(height: 86.v),
                              _buildLineTwoRow(context),
                              SizedBox(height: 25.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 89.v,
                                        width: 88.h,
                                        padding: EdgeInsets.all(24.h),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGoogle)),
                                    Container(
                                        height: 89.v,
                                        width: 88.h,
                                        margin: EdgeInsets.only(left: 26.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 21.h, vertical: 17.v),
                                        decoration: AppDecoration
                                            .outlineSecondaryContainer
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder12),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgVector,
                                            height: 47.v,
                                            width: 39.h,
                                            alignment: Alignment.center))
                                  ]),
                              SizedBox(height: 36.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text("Not a member?",
                                            style: theme.textTheme.bodyLarge)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtRegisterNow(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 6.h),
                                            child: Text("Register now",
                                                style: CustomTextStyles
                                                    .titleMediumBlue400)))
                                  ])
                            ])))))));
  }

  /// Section Widget
  Widget _buildLineTwoRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 12.v, bottom: 10.v),
              child: SizedBox(width: 107.h, child: Divider())),
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child:
                  Text("Or continue with", style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(top: 12.v, bottom: 10.v),
              child: SizedBox(width: 147.h, child: Divider(indent: 28.h)))
        ]));
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageScreen);
  }

  /// Navigates to the signUpOneScreen when the action is triggered.
  onTapTxtRegisterNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpOneScreen);
  }
}
