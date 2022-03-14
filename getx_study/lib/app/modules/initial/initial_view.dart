import 'package:getx_study/app/modules/home/home_view.dart';
import 'package:getx_study/app/modules/initial/initial_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_study/app/routes/app_routes.dart';
import 'package:getx_study/app/themes/app_theme.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends GetView<InitialController> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                SplashScreenInitialColor,
                SplashScreenFinishColor,
              ],
            ),
            navigateAfterSeconds: Routes.WELCOME,
          ),
          Container(
            margin: EdgeInsets.all(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/online-shop.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
