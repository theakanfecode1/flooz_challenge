import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/create_passcode/view/create_passcode_form.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasscodePage extends StatefulWidget {
  const CreatePasscodePage({Key? key}) : super(key: key);

  @override
  State<CreatePasscodePage> createState() => _CreatePasscodePageState();
}

class _CreatePasscodePageState extends State<CreatePasscodePage> {


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
      body: BlocProvider(
        create: (_) => CreatePasscodeBloc(),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppSpacings.xl),
                child: CreatePasscodeForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
