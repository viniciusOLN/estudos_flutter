import 'package:flutter/material.dart';

class ItemProfileMenu {
  String title;
  String subtitle;
  String leading;
  Icon trailing;
  Function onTap;

  ItemProfileMenu(
      {this.title, this.subtitle, this.leading, this.trailing, this.onTap});
}
