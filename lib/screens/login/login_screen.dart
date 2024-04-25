import 'package:crystalonbritsols_task/screens/login/login_screen_controller.dart';
import 'package:crystalonbritsols_task/widgets/custom_loader_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomLoaderWidget(
        isLoading: _controller.isLoading.value,
        child: Scaffold(
          appBar: _appBar,
          body: Container(
            padding:
                const EdgeInsets.only(left: 24, top: 24, bottom: 50, right: 24),
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.userNameTEC,
                  decoration: const InputDecoration(hintText: "Username"),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                TextFormField(
                  controller: _controller.passwordTEC,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      _onLoginButtonClick();
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      leading: Container(),
      title: const Text(
        "Login",
      ),
      centerTitle: true,
    );
  }

  _onLoginButtonClick() async {
    FocusScope.of(context).unfocus();
    _controller.onUserLoginTap();
  }
}
