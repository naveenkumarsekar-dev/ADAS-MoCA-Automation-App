import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:adas_development/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignUpOneScreen extends StatelessWidget {
  SignUpOneScreen({Key? key}) : super(key: key);

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  TextEditingController confirmPasswordFieldController =
      TextEditingController();

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
                                horizontal: 15.h, vertical: 38.v),
                            child: Column(children: [
                              SizedBox(height: 98.v),
                              CustomImageView(
                                  imagePath: ImageConstant.imgAdasHighResol,
                                  height: 80.v,
                                  width: 107.h),
                              SizedBox(height: 21.v),
                              Text("Let’s create an account for you!",
                                  style: theme.textTheme.bodyLarge),
                              SizedBox(height: 23.v),
                              _buildEmailField(context),
                              SizedBox(height: 15.v),
                              _buildPasswordField(context),
                              SizedBox(height: 15.v),
                              _buildConfirmPasswordField(context),
                              SizedBox(height: 25.v),
                              _buildSignUpButton(context),
                              SizedBox(height: 86.v),
                              _buildRowWithLines(context),
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
                                  ])
                            ]))))),
            bottomNavigationBar: _buildConfirmationRow(context)));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: emailFieldController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: passwordFieldController,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildConfirmPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
            controller: confirmPasswordFieldController,
            hintText: "Confirm Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 11.h, vertical: 21.v)));
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        height: 66.v,
        text: "Sign Up",
        margin: EdgeInsets.symmetric(horizontal: 30.h),
        buttonStyle: CustomButtonStyles.fillBlack,
        buttonTextStyle: CustomTextStyles.titleMediumSecondaryContainer);
  }

  /// Section Widget
  Widget _buildRowWithLines(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.only(top: 12.v, bottom: 10.v),
          child: SizedBox(width: 107.h, child: Divider())),
      Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Text("Or continue with", style: theme.textTheme.bodyLarge)),
      Padding(
          padding: EdgeInsets.only(top: 12.v, bottom: 10.v),
          child: SizedBox(width: 140.h, child: Divider(indent: 21.h)))
    ]);
  }

  /// Section Widget
  Widget _buildConfirmationRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 59.h, right: 67.h, bottom: 39.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Already have an account?", style: theme.textTheme.bodyLarge),
          GestureDetector(
              onTap: () {
                onTapTxtLoginNow(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("Login now",
                      style: CustomTextStyles.titleMediumBlue400)))
        ]));
  }

  /// Navigates to the signInOneScreen when the action is triggered.
  onTapTxtLoginNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInOneScreen);
  }
}
