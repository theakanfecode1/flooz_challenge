import 'package:flooz_challenge/authentication/bloc/authentication_bloc.dart';
import 'package:flooz_challenge/authentication/bloc/authentication_event.dart';
import 'package:flooz_challenge/res/components/flooz_button.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  static Page<void> page() =>
      const MaterialPage<void>(child: HomePage());
  const HomePage({Key? key}) : super(key: key);

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
              Builder(builder: (context) {
                final name = context.select(
                  (AuthenticationBloc bloc) =>
                      bloc.state.user.name.capitalizeFirst,
                );
                final email = context.select(
                  (AuthenticationBloc bloc) =>
                      bloc.state.user.email.capitalizeFirst,
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/profile_image.png',
                      width: 192,
                    ),
                    const SizedBox(
                      height: AppSpacings.m,
                    ),
                    Text(
                      name,
                      style: AppTextStyles.kH1,
                    ),
                    Text(
                      email,
                      style: AppTextStyles.kH1,
                    ),
                  ],
                );
              }),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: FloozButton(
                    onTap: () {
                      logout(context);
                    },
                    label: 'Clear Account',
                    backgroundColor: AppColors.grey700,
                  )),
                  const SizedBox(
                    width: AppSpacings.m,
                  ),
                  Expanded(
                      child: FloozButton(
                          onTap: () {
                            logout(context);
                          },
                          label: 'Log out')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
  }
}
