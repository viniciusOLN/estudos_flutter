import 'package:flutter/material.dart';
import 'app/pages/splash_screen.dart';
import 'app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpo App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: kDefaultColor,
      ),
    );
  }
}
