import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/create_account/view/create_account_page.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacings.m, vertical: AppSpacings.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: AppSpacings.xxxl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile_image.png',
                    width: 192,
                  ),
                  const SizedBox(
                    height: AppSpacings.m,
                  ),
                  const Text(
                    'Name',
                    style: AppTextStyles.kH1,
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: FloozButton(
                    onTap: () {
                      pushWithReplacement( const CreateAccountPage());
                    },
                    label: 'Clear Account',
                    backgroundColor: AppColors.grey700,
                  )),
                  const SizedBox(
                    width: AppSpacings.m,
                  ),
                  Expanded(child: FloozButton(onTap: () {
                    pushWithReplacement( const CreateAccountPage());
                  }, label: 'Log out')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
