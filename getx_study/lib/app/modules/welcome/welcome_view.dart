import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/welcome/welcome_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_study/app/routes/app_routes.dart';
import 'package:getx_study/app/themes/app_theme.dart';
import 'package:getx_study/app/utils/widgets/background.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "BARBER APP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "ENTRAR",
                press: () => Get.toNamed(Routes.LOGIN),
              ),
              RoundedButton(
                text: "CADASTRAR",
                color: appThemeData.primaryColor,
                textColor: Colors.black,
                press: () => Get.toNamed('/signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
