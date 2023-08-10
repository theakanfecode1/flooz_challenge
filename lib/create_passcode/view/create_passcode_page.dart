import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/components/flooz_text_field.dart';
import 'package:flooz_challenge/components/pin_code/flooz_pin_code_text_field.dart';
import 'package:flooz_challenge/components/pin_code/pin_theme.dart';
import 'package:flooz_challenge/home/view/home_page.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';

class CreatePasscodePage extends StatefulWidget {
  const CreatePasscodePage({Key? key}) : super(key: key);

  @override
  State<CreatePasscodePage> createState() => _CreatePasscodePageState();
}

class _CreatePasscodePageState extends State<CreatePasscodePage> {
  final TextEditingController _pinCodeTextEditingController =
      TextEditingController();

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/arrow_left.png'),
          onPressed: () {
            pop();
          },
        ),
        backgroundColor: AppColors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: AppSpacings.xm,
                      ),
                      const Text(
                        'Create passcode',
                        style: AppTextStyles.kH1,
                      ),
                      const SizedBox(
                        height: AppSpacings.xxs,
                      ),
                      const Text(
                        'Make it 💪 – Refrain from sequences (123456) and repeated numbers (111234)',
                        style: AppTextStyles.kB1Grey,
                      ),
                      const SizedBox(
                        height: AppSpacings.xxxl,
                      ),
                      FloozPinCodeTextField(
                        context: context,
                        length: 6,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            borderRadius: BorderRadius.circular(14),
                            fieldHeight: 46,
                            fieldWidth: 46,
                            borderWidth: 2.0,
                            activeFillColor: AppColors.grey500,
                            inactiveFillColor: AppColors.grey400,
                            selectedFillColor: AppColors.grey500,
                            activeColor:
                                hasError ? AppColors.red : AppColors.black,
                            selectedColor:
                                hasError ? AppColors.red : AppColors.black,
                            disabledColor:
                                hasError ? AppColors.red : AppColors.grey400,
                            inactiveColor:
                                hasError ? AppColors.red : AppColors.grey400,
                            fieldOuterPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0)),
                        controller: _pinCodeTextEditingController,
                        validator: (text) {
                          // if (!isAlphanumeric(text!.trim()) ||
                          //     text!.trim().length < 4) {
                          //   // setState(() {
                          //   errorMessage = 'Otp must contain 4 characters';
                          //   // });
                          //   return '';
                          // } else {
                          //   return null;
                          // }
                        },
                        onChanged: (String value) {
                          // if (isAlphanumeric(value) && value.length == 4) {
                          //   setState(() {
                          //     isEnabled = true;
                          //   });
                          // } else {
                          //   setState(() {
                          //     isEnabled = false;
                          //   });
                          // }
                        },
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: AppSpacings.xm,
                  ),
                  FloozButton(
                      onTap: () {
                        popAllAndPush(const HomePage());
                      },
                      label: 'Confirm'),
                  const SizedBox(
                    height: AppSpacings.xxl,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
