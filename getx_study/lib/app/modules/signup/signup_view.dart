import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/signup/signup_controller.dart';
import 'package:getx_study/app/utils/widgets/background.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_field.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "REGISTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/signup.svg",
                  height: Get.height * 0.35,
                ),
                RoundedInputField(
                  hintText: "Usuário",
                  controller: null,
                  onChanged: (value) {},
                ),

                /* OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/google-plus.svg",
                      press: () {},
                    ),
                  ],
                ) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
