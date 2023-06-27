import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String title;

  const ButtonWidget({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        child: MaterialButton(
            onPressed: onTap,
            height: 40,
            color: Colors.black87,
            minWidth: MediaQuery.of(context).size.width,
            child: Text(title, style: const TextStyle(color: Colors.white))));
  }
}
