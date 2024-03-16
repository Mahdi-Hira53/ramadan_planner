import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/auth_services/auth_services.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../../view_models/auth_vm/auth_vm.dart';
import '../../view_models/widgets/button.dart';
import '../../view_models/widgets/input_field.dart';
import 'login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  FirebaseAuth auth = FirebaseAuth.instance;
  AuthVM authVM = AuthVM();

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isVisible = true;

  dynamic userInfo = Get.arguments;
  void createNewUser() {
    authVM.createNewUser(
        formKey, name.text.trim(), email.text.trim(), password.text.trim());
  }
  // void storeUserInfo(){
  //   authVM.storeUserInfo(formKey,name.text.trim(), email.text.trim(), number.text.trim());
  // }


  // Future<void> storeUserInfo() async {
  //   if (formKey.currentState!.validate()) {
  //     Map<String, dynamic> userInfoMap = {}; // Initialize as Map<String, dynamic>
  //     userInfoMap["name"] = name.text.trim();
  //     userInfoMap["email"] = email.text.trim();
  //     userInfoMap["number"] = number.text.trim();
  //
  //     // Check if userInfo was previously initialized
  //     if (userInfo != null && userInfo is Map<String, dynamic>) {
  //       userInfo = userInfoMap; // Update userInfo if it was already a Map<String, dynamic>
  //     } else {
  //       userInfo = userInfoMap; // Initialize userInfo if it was null or not of the correct type
  //     }
  //
  //     await AuthService().storeUserInfo(userInfo!);
  //     Get.offAll(const LogIn());
  //   }
  // }

  storeUserInfo(String uid, String name, String email, String number)async{
    String uid = auth.currentUser!.uid;
    await AuthService().storeUserInfo(
      uid, name.trim(),email.trim(),number.trim()
    );
    Get.offAll(const LogIn());
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
                height: size.height * 0.1,
              ),
              Text(
                "Create an Account",
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
                  controller: name,
                  leadingWidget: Icon(
                    Icons.person,
                    color: Colors.grey[800],
                  ),
                  hint: "Enter your name"),
              MyInputField(
                  controller: email,
                  leadingWidget: Icon(Icons.email, color: Colors.grey[800]),
                  hint: "Enter your email"),
              MyInputField(
                  controller: number,
                  leadingWidget: Icon(Icons.phone, color: Colors.grey[800]),
                  hint: "Enter your number"),
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
                              controller: confirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your confirm password please";
                                }
                                return null;
                              },
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_open),

                                hintText: "Confirm Password",
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
              SizedBox(
                height: size.height * 0.03,
              ),
              MyButton(
                  label: "Sign Up",
                  onTap: () {
                    createNewUser();
                    // storeUserInfo(
                    //   auth.currentUser!.uid,
                    //   name.text.trim(),
                    //   email.text.trim(),
                    //   number.text.trim(),
                    // );
                  },
                  width: size.width * 0.7,
                  height: size.height * 0.07,
                  fontSize: 20),
              SizedBox(
                height: size.height * 0.13,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
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
                      Get.to(const LogIn());
                    },
                    style: TextButton.styleFrom(foregroundColor: primaryClr),
                    child: Text(
                      "Sign In",
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
}
