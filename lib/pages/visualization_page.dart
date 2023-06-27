import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/service/shared_preference_service.dart';
import 'package:flutter_shared_preference/widget/app_bar_widget.dart';

class VisualizationPage extends StatefulWidget {
  const VisualizationPage({super.key});

  @override
  State<VisualizationPage> createState() => _VisualizationPageState();
}

class _VisualizationPageState extends State<VisualizationPage> {
  String email = "";
  String password = "";

  @override
  void initState() {
    _setEmailAndPassword();
    super.initState();
  }

  _setEmailAndPassword() {
    SharedPreferenceService preferenceService = SharedPreferenceService();
    setState(() {
      email = preferenceService.read("email");
      password = preferenceService.read("password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(disableIcon: true),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(email, style: const TextStyle(fontSize: 16, color: Colors.black)),
              Padding(
                  padding: const EdgeInsets.only(top: 20), child: Text(password, style: const TextStyle(fontSize: 16)))
            ]));
  }
}
