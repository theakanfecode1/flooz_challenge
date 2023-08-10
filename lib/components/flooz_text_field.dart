import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FloozTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onTextChanged;

  const FloozTextField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.validator,
      required this.title,
      required this.onTextChanged,
      this.textInputAction = TextInputAction.next,
      required this.controller})
      : super(key: key);

  @override
  _FloozTextFieldState createState() => _FloozTextFieldState();
}

class _FloozTextFieldState extends State<FloozTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.kH2,
        ),
        const SizedBox(
          height: AppSpacings.xm,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.black,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(17),
            fillColor: AppColors.grey400,
            errorMaxLines: 3,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.grey400,
                style: BorderStyle.solid,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.grey400,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.grey400,
                style: BorderStyle.solid,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.red,
                style: BorderStyle.solid,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.red,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
