import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/view/create_account_form.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (_) => CreateAccountBloc(),
        child: const SafeArea(
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
      ),
    );
  }
}
