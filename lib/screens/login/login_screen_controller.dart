import 'package:crystalonbritsols_task/navigation_path.dart';
import 'package:crystalonbritsols_task/screens/login/data/generate_token_response.dart';
import 'package:crystalonbritsols_task/screens/login/repo/login_repo.dart';
import 'package:crystalonbritsols_task/services/storage_helper.dart';
import 'package:crystalonbritsols_task/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = RxBool(false);

  TextEditingController userNameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  LoginRepo loginRepo = LoginRepo();
  GenerateTokenResponse? generateTokenResponse;

  onUserLoginTap() async {
    try {
      isLoading(true);
      if (userNameTEC.text.isNotEmpty && passwordTEC.text.isNotEmpty) {
        generateTokenResponse = await loginRepo.login(
            username: userNameTEC.text, password: passwordTEC.text);
      }

      if (generateTokenResponse != null) {
        await StorageHelper.mInstance.setString(
          StorageHelper.storageAccessToken,
          "${generateTokenResponse!.tokenType} ${generateTokenResponse!.accessToken!}",
        );
        Get.offAllNamed(NavigationPath.homeScreen);
      }
    } catch (e) {
      printLog(e);
    } finally {
      isLoading(false);
    }
  }
}
