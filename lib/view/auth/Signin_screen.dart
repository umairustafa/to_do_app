import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/Forgotpassword_screen.dart';
import 'package:to_do_app/view/auth/sign_up_screen.dart';
import 'package:to_do_app/view/user/add_todo_screen.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';
import 'package:to_do_app/widgets/fields/CommonTextField.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 324, top: 22, left: 14),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                  child: Icon(
                    AppIcons.arrow_circle_left_outlined,
                    size: 40.sp,
                  )),
            ),
            SizedBox(
              height: 79.h,
            ),
            Text(
              'Welcome Back!',
              style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 92),
                child: Image.asset(
                  AppImages.Image3,
                )),
            SizedBox(
              height: 8.h,
            ),
            CommonTextfield(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                hintText: 'Enter your Email address ',
                controller: EmailController),
            SizedBox(
              height: 20.h,
            ),
            CommonTextfield(
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },
                hintText: 'Confirm Password',
                controller: PasswordController),
            SizedBox(
              height: 45.h,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotpasswordScreen(),
                      ));
                },
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      color: AppColors.color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      height: 7.h),
                )),
            SizedBox(
              height: 10.h,
            ),
            Commonbutton(
                isLoading: isLoading,
                title: 'Sign In',
                onTap: () async {
                  try {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: EmailController.text,
                        password: PasswordController.text,
                      );

                      Get.to(() => AddTodoScreen());
                      setState(() {
                        isLoading = false;
                      });
                    }
                  } catch (e) {
                    Get.snackbar("error", e.toString());
                    setState(() {
                      isLoading = false;
                    });
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 35),
              child: Row(
                children: [
                  Text('Already have an account ? '),
                  GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: AppColors.color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
