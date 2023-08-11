import 'package:flooz_challenge/authentication/bloc/authentication_bloc.dart';
import 'package:flooz_challenge/authentication/bloc/authentication_event.dart';
import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              Builder(builder: (context) {
                final title = context.select(
                  (AuthenticationBloc bloc) =>
                      '${bloc.state.user.name.capitalizeFirst}\n${bloc.state.user.email.capitalizeFirst}',
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
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.kH1,
                    )
                  ],
                );
              }),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: FloozButton(
                    onTap: () {
                      logout();
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
                            logout();
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

  void logout() {
    context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
  }
}
