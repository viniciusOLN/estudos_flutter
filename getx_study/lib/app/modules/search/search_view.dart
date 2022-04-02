import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/search/search_controller.dart';

class Searchpage extends GetView<SearchController> {
  const Searchpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('search'),
    );
  }
}
