import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class FloozTextField extends StatefulWidget {
  final String title;
  final String? errorMessage;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onTextChanged;

  const FloozTextField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.title,
      required this.onTextChanged,
       this.errorMessage,
      this.textInputAction = TextInputAction.next,})
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
          cursorColor: AppColors.black,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(17),
            fillColor: AppColors.grey400,
            errorMaxLines: 3,
            isDense: true,
            errorText: widget.errorMessage,
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
