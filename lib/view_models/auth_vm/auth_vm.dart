import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/auth_services/auth_services.dart';
import '../../views/auth_screen/login.dart';
import '../../views/home_screen/home_screen.dart';

class AuthVM {
  AuthService authService = AuthService();
  dynamic userInfo = Get.arguments;

  Future<void> createNewUser(GlobalKey<FormState> formKey, String name,
      String email, String password) async {
    if (formKey.currentState!.validate()) {
      final flag = await authService.createUser(email.trim(), password.trim());
      if (flag.contains("true")) {
        Get.snackbar(
          "Hi $name",
          "A verification message sent to your email $email",
          duration: const Duration(seconds: 10),
        );
      } else {
        Get.snackbar(
          "An error occurs",
          flag,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }

  Future<void> logIn(
      GlobalKey<FormState> formKey, String email, String password) async {
    String flag = await authService.loginUser(email.trim(), password.trim());
    if (flag == "true") {
      Get.offAll(const HomeScreen());
    } else {
      Get.snackbar("Something went wrong", flag,
          duration: const Duration(seconds: 5));
    }
  }

  Future<void> storeUserInfo(GlobalKey<FormState> formKey, String name,
      String email, String number) async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> userInfoMap = {};
      userInfo["name"] = name.trim();
      userInfo["email"] = email.trim();
      userInfo["number"] = number.trim();

      if (userInfo != null && userInfo is Map<String, dynamic>) {
        userInfo = userInfoMap;
      } else {
        userInfo = userInfoMap;
      }

      //await authService.storeUserInfo();
      Get.offAll(const LogIn());
    }
  }

  Future<void> resetPassword(
    GlobalKey<FormState> formKey,
    String email,
  ) async {
    String flag = await authService.resetPassword(email.trim());
    if (flag == "true") {
      Get.snackbar("Dear User", "An password reset link is sent to $email",
          duration: const Duration(seconds: 5));
    } else {
      Get.snackbar("Something went wrong!", flag,
          duration: const Duration(seconds: 5));
    }
  }
}
