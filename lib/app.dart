import 'package:flooz_challenge/authentication/bloc/authentication_bloc.dart';
import 'package:flooz_challenge/create_account/bloc/create_account_bloc.dart';
import 'package:flooz_challenge/create_account/view/create_account_page.dart';
import 'package:flooz_challenge/create_passcode/bloc/create_passcode_bloc.dart';
import 'package:flooz_challenge/home/view/home_page.dart';
import 'package:flooz_challenge/repository/authentication/authentication_repository.dart';
import 'package:flooz_challenge/repository/user/user_repository.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/utils/constants.dart';
import 'package:flooz_challenge/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/bloc/authentication_state.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository,
            userRepository: _userRepository,
          ),
        ),
        BlocProvider(
          create: (_) => CreateAccountBloc(
            userRepository: _userRepository,
          ),
        ),
        BlocProvider(
          create: (_) => CreatePasscodeBloc(
            authenticationRepository: _authenticationRepository,
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flooz Challenge',
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                popAllAndPush(const HomePage());
                break;
              case AuthenticationStatus.unauthenticated:
                popAllAndPush(const CreateAccountPage());
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.black,
          fontFamily: ('AlbertSans'),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: AppColors.black)),
      home: const CreateAccountPage(),
    );
  }
}
