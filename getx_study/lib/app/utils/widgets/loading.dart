import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Get.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: const ElevatedButton(
          onPressed: null,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
