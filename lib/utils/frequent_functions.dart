import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum APIStatus { success, fail, ok }

class FrequentFunctions {
  FrequentFunctions._();

  static successToast(String message) =>
      showToast("Success", message, Icons.check_circle, Colors.green);

  static errorToast(String message) =>
      showToast("Error", message, Icons.error, Colors.red);

  static showToast(String title, String message, IconData icon, Color color) {
    Get.rawSnackbar(
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        shouldIconPulse: false,
        icon: Icon(
          icon,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: color,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM);
  }

  static String getAPIStatus(APIStatus status) {
    switch (status) {
      case APIStatus.success:
        return "Success";
      case APIStatus.fail:
        return "Fail";
      case APIStatus.ok:
        return "OK";
    }
  }
}
