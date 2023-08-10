import 'package:flooz_challenge/components/flooz_button.dart';
import 'package:flooz_challenge/components/flooz_text_field.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_state.dart';
import 'package:flooz_challenge/create_passcode/view/create_passcode_page.dart';
import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
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
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          pushTo(const CreatePasscodePage());
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
                height: AppSpacings.xxxxl,
              ),
              const Text(
                'Create Account',
                style: AppTextStyles.kH1,
              ),
              const SizedBox(
                height: AppSpacings.xxl,
              ),
              BlocBuilder<CreateAccountBloc, CreateAccountState>(
                buildWhen: (previous, current) => previous.name != current.name,
                builder: (context, state) {
                  return FloozTextField(
                      title: 'Name',
                      errorMessage: state.name.displayError != null
                          ? 'Name must be a valid string with at least 2 characters, containing only letters.'
                          : null,
                      onTextChanged: (text) {
                        context
                            .read<CreateAccountBloc>()
                            .add(NameChanged(name: text));
                      },
                      controller: _nameTextEditingController);
                },
              ),
              const SizedBox(
                height: AppSpacings.l,
              ),
              BlocBuilder<CreateAccountBloc, CreateAccountState>(
                  buildWhen: (previous, current) => previous.email != current.email,
                  builder: (context, state) {
                return FloozTextField(
                    title: 'Email',
                    errorMessage: state.email.displayError != null
                        ? 'Please ensure the email entered is valid.'
                        : null,
                    onTextChanged: (text) {
                      context
                          .read<CreateAccountBloc>()
                          .add(EmailChanged(email: text));
                    },
                    controller: _emailTextEditingController);
              }),
            ],
          )),
          const SizedBox(
            height: AppSpacings.xm,
          ),
          BlocBuilder<CreateAccountBloc, CreateAccountState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
            return FloozButton(
                onTap: () {
                  context.read<CreateAccountBloc>().add(const FormSubmitted());
                },
                label: 'Next');
          }),
          const SizedBox(
            height: AppSpacings.xxl,
          ),
        ],
      ),
    );
  }
}
