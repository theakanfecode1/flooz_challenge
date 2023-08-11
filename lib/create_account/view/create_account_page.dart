import 'package:flooz_challenge/create_account/view/create_account_form.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  static Page<void> page() =>
      const MaterialPage<void>(child: CreateAccountPage());
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                child: CreateAccountForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
