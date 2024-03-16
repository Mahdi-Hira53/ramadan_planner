
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_planner/views/auth_screen/register.dart';

import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../../view_models/auth_vm/auth_vm.dart';
import '../../view_models/widgets/button.dart';
import '../../view_models/widgets/input_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  AuthVM authVM = AuthVM();
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = true;

  void logIn() {
    authVM.logIn(
        formKey, email.text.trim(), password.text.trim());
  }

  void resetPassword(){
    authVM.resetPassword(formKey, email.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              Text(
                "Welcome",
                style: SafeGoogleFont(
                  'Poppins',
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: primaryClr,
                  ),
                ),
              ),

              MyInputField(
                  controller: email,
                  leadingWidget: Icon(Icons.email, color: Colors.grey[800]),
                  hint: "Enter your email"),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 52,
                            margin: const EdgeInsets.only(top: 8.0),
                            //padding: const EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your password please";
                                }
                                return null;
                              },
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_open),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: "Password",
                                hintStyle: subTitleStyle,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0,
                                  ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                //filled: true,
                                fillColor: Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),


              TextButton(
                onPressed: () {
                  resetDialog();
                },
                style: TextButton.styleFrom(foregroundColor: primaryClr),
                child: Text(
                  "Forget Password",
                  style: SafeGoogleFont(
                    'Poppins',
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              MyButton(
                  label: "Sign In",
                  onTap: () {
                    logIn();
                  },
                  width: size.width * 0.7,
                  height: size.height * 0.07,
                  fontSize: 20),
              SizedBox(
                height: size.height * 0.25
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Did not registered yet?",
                    style: SafeGoogleFont(
                      'Poppins',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const Registration());
                    },
                    style: TextButton.styleFrom(foregroundColor: primaryClr),
                    child: Text(
                      "Sign Up",
                      style: SafeGoogleFont(
                        'Poppins',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: primaryClr,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetDialog() {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 9),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email & tap sent button to get a email with password reset link.",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: primaryClr,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MyInputField(
                  controller: email,
                  leadingWidget: Icon(Icons.email, color: Colors.grey[800]),
                  hint: "Enter your email"),
              const SizedBox(height: 30),
              MyButton(
                  label: "Reset Password",
                  onTap: () {
                    resetPassword();
                  },
                  width: size.width * 0.7,
                  height: size.height * 0.07,
                  fontSize: 20),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
