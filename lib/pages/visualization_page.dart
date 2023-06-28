import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/service/shared_preference_service.dart';
import 'package:flutter_shared_preference/widget/app_bar_widget.dart';
import 'package:flutter_shared_preference/widget/button_widget.dart';

class VisualizationPage extends StatefulWidget {
  const VisualizationPage({super.key});

  @override
  State<VisualizationPage> createState() => _VisualizationPageState();
}

class _VisualizationPageState extends State<VisualizationPage> {
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _setEmailAndPassword();
  }

  void _setEmailAndPassword() async {
    SharedPreferenceService preferenceService = SharedPreferenceService();
    String emailPrefer = await preferenceService.read("email");
    String passwordPrefer = await preferenceService.read("password");
    setState(() {
      email = emailPrefer;
      password = passwordPrefer;
    });
  }

  void _deleteInformation() async {
    SharedPreferenceService preferenceService = SharedPreferenceService();
    preferenceService.cleanLocalData();
    _setEmailAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(disableIcon: true, title: "Account logged in"),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Email: $email', style: const TextStyle(fontSize: 16, color: Colors.black)),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Password: $password', style: const TextStyle(fontSize: 16)))
            ])),
        bottomNavigationBar: ButtonWidget(onTap: _deleteInformation, title: "Clean Information"));
  }
}
