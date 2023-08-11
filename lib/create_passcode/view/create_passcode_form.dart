import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/components/pin_code/flooz_pin_code_text_field.dart';
import 'package:flooz_challenge/components/pin_code/pin_theme.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_event.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_state.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/res/ui_helpers.dart';
import 'package:flooz_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CreatePasscodeForm extends StatefulWidget {
  const CreatePasscodeForm({Key? key}) : super(key: key);

  @override
  State<CreatePasscodeForm> createState() => _CreatePasscodeFormState();
}

class _CreatePasscodeFormState extends State<CreatePasscodeForm> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePasscodeBloc, CreatePasscodeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          showErrorToast(context,state.passcode.getErrorMessage);
        }

      },
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
              BlocBuilder<CreatePasscodeBloc, CreatePasscodeState>(
                  buildWhen: (previous, current) =>
                      previous.passcode != current.passcode,
                  builder: (context, state) {
                    bool hasError = state.passcode.displayError != null;
                    return FloozPinCodeTextField(
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
                      onChanged: (String value) {
                        context
                            .read<CreatePasscodeBloc>()
                            .add(PasscodeChanged(passcode: value));
                      },
                    );
                  }),
            ],
          )),
          const SizedBox(
            height: AppSpacings.xm,
          ),
          BlocBuilder<CreatePasscodeBloc, CreatePasscodeState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
                return FloozButton(
                    onTap: () {
                      context.read<CreatePasscodeBloc>().add(const FormSubmitted());
                    },
                    label: 'Confirm');
              }),
          const SizedBox(
            height: AppSpacings.xxl,
          ),
        ],
      ),
    );
  }
}
