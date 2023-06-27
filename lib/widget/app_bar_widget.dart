import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({required String title, super.key})
      : super(
            elevation: 10,
            backgroundColor: Colors.black87,
            title: Row(children: [
              const Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.edit)),
              Text(title),
            ]));
}
