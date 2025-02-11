import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/login_screen.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.color2,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 202),
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: AppImages.Image1
              ),
            ),
          ),SizedBox(height: 43.h,),
                     Center(child: Text('Get things done with TODo',style: TextStyle(fontSize: 23.sp,fontWeight: FontWeight.bold,color: Colors.black),)),
                     SizedBox(height: 18.h,),
                     Text('    Lorem ipsum dolor sit amet,\nconsectetur adipisicing. Maxime,\n  tempore! Animi nemo aut atque,\ndeleniti nihil dolorem repellendus')
      , SizedBox(height: 75.h,),
      
   Commonbutton(title:' Get Started ', onTap: (){

Get.to(LoginScreen());

// Get.back();
      // Navigator.push(context,  MaterialPageRoute(builder: (context) => LoginScreen(),));
   })
        ],
      ),
    );
  }
}