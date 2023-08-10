import 'package:flooz_challenge/create_account/view/create_account_page.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flooz Challenge',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.black,
          fontFamily: ('AlbertSans' ),
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.black)),
      home:  const CreateAccountPage(),
    );
  }
}
