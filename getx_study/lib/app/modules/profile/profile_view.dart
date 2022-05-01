import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/profile/profile_controller.dart';
import 'package:getx_study/app/themes/app_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          //SizedBox(height: Get.height * 0.02),
          CircleAvatar(
            maxRadius: Get.size.width > 500 ? 48 : 30,
            child: Icon(
              Icons.person,
              size: Get.size.width > 500 ? 60 : 20,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                controller.getUserFullName(),
                style: TextThemeDefault.cardDefaultTextStyle,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Colors.white,
            ),
            height: Get.size.width > 500 ? 120 : 80,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/wallet.png'),
                        onPressed: () {
                          Get.toNamed('/payments');
                        },
                      ),
                      Text(
                        'Pagamentos',
                        style: TextThemeDefault.profileFastCardText,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/truck.png'),
                        onPressed: () {
                          Get.toNamed('/schedules');
                        },
                      ),
                      Text(
                        'Agendamentos',
                        style: TextThemeDefault.profileFastCardText,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/card.png'),
                        onPressed: () {
                          Get.toNamed('/ratings');
                        },
                      ),
                      Text(
                        'Avaliações',
                        style: TextThemeDefault.profileFastCardText,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: controller.listItemMenu.length,
              itemBuilder: (context, indice) {
                final item = controller.listItemMenu[indice];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      leading: Image.asset(
                        item.leading,
                        fit: BoxFit.scaleDown,
                        width: 30,
                        height: 30,
                      ),
                      trailing: item.trailing,
                      onTap: item.onTap,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            "Algum problema? Relate para nós em 'Ajuda & suporte' ou em: contato@app.com.br",
            style: TextThemeDefault.footerTextProfile,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
