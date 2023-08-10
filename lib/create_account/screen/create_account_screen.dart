import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/components/flooz_text_field.dart';
import 'package:flooz_challenge/create_passcode/screen/create_passcode_screen.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
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
                          height: AppSpacings.xxxxl,
                        ),
                        const Text(
                          'Create Account',
                          style: AppTextStyles.kH1,
                        ),
                        const SizedBox(
                          height: AppSpacings.xxl,
                        ),
                        FloozTextField(
                            validator: (text) {},
                            title: 'Name',
                            onTextChanged: (text) {},
                            controller: _nameTextEditingController),
                        const SizedBox(
                          height: AppSpacings.l,
                        ),
                        FloozTextField(
                            validator: (text) {},
                            title: 'Email',
                            onTextChanged: (text) {},
                            controller: _emailTextEditingController),
                      ],
                    )),
                    const SizedBox(
                      height: AppSpacings.xm,
                    ),
                    FloozButton(
                        onTap: () {
                          pushTo(const CreatePasscodeScreen());
                        },
                        label: 'Next'),
                    const SizedBox(
                      height: AppSpacings.xxl,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
