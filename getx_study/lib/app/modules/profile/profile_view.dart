import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('profile'),
    );
  }
}
