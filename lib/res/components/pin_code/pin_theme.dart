import 'package:flooz_challenge/res/components/pin_code/flooz_pin_code_text_field.dart';
import 'package:flutter/material.dart';

class PinTheme {
  final Color activeColor;
  final Color selectedColor;
  final Color inactiveColor;
  final Color disabledColor;
  final Color activeFillColor;
  final Color selectedFillColor;
  final Color inactiveFillColor;
  final Color errorBorderColor;
  final BorderRadius borderRadius;
  final double fieldHeight;
  final double fieldWidth;
  final double borderWidth;
  final PinCodeFieldShape shape;
  final EdgeInsetsGeometry fieldOuterPadding;

  const PinTheme.defaults({
    this.borderRadius = BorderRadius.zero,
    this.fieldHeight = 50,
    this.fieldWidth = 40,
    this.borderWidth = 2,
    this.fieldOuterPadding = EdgeInsets.zero,
    this.shape = PinCodeFieldShape.underline,
    this.activeColor = Colors.green,
    this.selectedColor = Colors.blue,
    this.inactiveColor = Colors.red,
    this.disabledColor = Colors.grey,
    this.activeFillColor = Colors.green,
    this.selectedFillColor = Colors.blue,
    this.inactiveFillColor = Colors.red,
    this.errorBorderColor = Colors.redAccent,
  });

  factory PinTheme(
      {Color? activeColor,
        Color? selectedColor,
        Color? inactiveColor,
        Color? disabledColor,
        Color? activeFillColor,
        Color? selectedFillColor,
        Color? inactiveFillColor,
        Color? errorBorderColor,
        BorderRadius? borderRadius,
        double? fieldHeight,
        double? fieldWidth,
        double? borderWidth,
        PinCodeFieldShape? shape,
        EdgeInsetsGeometry? fieldOuterPadding}) {
    const defaultValues = PinTheme.defaults();
    return PinTheme.defaults(
      activeColor:
      activeColor ?? defaultValues.activeColor,
      activeFillColor: activeFillColor ?? defaultValues.activeFillColor,
      borderRadius:
      borderRadius ?? defaultValues.borderRadius,
      borderWidth:
      borderWidth ?? defaultValues.borderWidth,
      disabledColor:
      disabledColor ?? defaultValues.disabledColor,
      fieldHeight:
      fieldHeight ?? defaultValues.fieldHeight,
      fieldWidth: fieldWidth ?? defaultValues.fieldWidth,
      inactiveColor:
      inactiveColor ?? defaultValues.inactiveColor,
      inactiveFillColor: inactiveFillColor ?? defaultValues.inactiveFillColor,
      errorBorderColor: errorBorderColor ?? defaultValues.errorBorderColor,
      selectedColor:
      selectedColor ?? defaultValues.selectedColor,
      selectedFillColor: selectedFillColor ?? defaultValues.selectedFillColor,
      shape: shape ?? defaultValues.shape,
      fieldOuterPadding: fieldOuterPadding ?? defaultValues.fieldOuterPadding,
    );
  }
}
