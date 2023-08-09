import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.black,
          fontFamily: ('AlbertSans' ),
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.black)),
      home:  Container(),
    );
  }
}
