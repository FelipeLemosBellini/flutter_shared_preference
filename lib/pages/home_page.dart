import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/pages/visualization_page.dart';
import 'package:flutter_shared_preference/service/shared_preference_service.dart';
import 'package:flutter_shared_preference/widget/app_bar_widget.dart';
import 'package:flutter_shared_preference/widget/button_widget.dart';
import 'package:flutter_shared_preference/widget/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  void saveEmailAndPassword() {
    SharedPreferenceService preferenceService = SharedPreferenceService();

    preferenceService.write("email", emailController.text);
    preferenceService.write("password", passwordController.text);

    callVisualizationPage();
  }

  void callVisualizationPage() =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => const VisualizationPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Saving local data"),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text("Create Account", style: TextStyle(fontSize: 24))),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 30), child: Text("Email", style: TextStyle(fontSize: 16))),
          TextFieldWidget(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              controller: emailController,
              focusNode: emailFocusNode,
              labelText: "Fill in your email"),
          const Padding(padding: EdgeInsets.only(left: 30), child: Text("Password", style: TextStyle(fontSize: 16))),
          TextFieldWidget(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              controller: passwordController,
              focusNode: passwordFocusNode,
              labelText: "Fill in your password")
        ]),
        bottomNavigationBar: ButtonWidget(onTap: saveEmailAndPassword, title: "Login"));
  }
}
