import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({String title = "", bool disableIcon = false, super.key})
      : super(
            elevation: 10,
            backgroundColor: Colors.black87,
            title: Row(children: [
              Offstage(
                  offstage: disableIcon,
                  child: const Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.edit))),
              Text(title)
            ]));
}
