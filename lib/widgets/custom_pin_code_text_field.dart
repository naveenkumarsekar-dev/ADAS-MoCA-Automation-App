import 'package:adas_development/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  final Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 10,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.bodyMediumSecondaryContainer,
        hintStyle: hintStyle ?? CustomTextStyles.bodyMediumSecondaryContainer,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 27.h,
          fieldWidth: 27.h,
          shape: PinCodeFieldShape.circle,
          inactiveColor: appTheme.black90002,
          activeColor: appTheme.black90002,
          inactiveFillColor:
              theme.colorScheme.secondaryContainer.withOpacity(1),
          activeFillColor: theme.colorScheme.secondaryContainer.withOpacity(1),
          selectedColor: Colors.transparent,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
