import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/Signin_screen.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';
import 'package:to_do_app/widgets/fields/CommonTextField.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  
   

   final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
       body: SingleChildScrollView(
         child: Form(
          key: _formKey,

           child: Column(children: [   Padding(
            padding: const EdgeInsets.only(right: 324,top: 32,left: 14),
            
              child: GestureDetector(onTap: () {
                 Navigator.pop(context,  MaterialPageRoute(builder: (context) => SigninScreen(),));
              },
                child: Icon(AppIcons.arrow_circle_left_outlined,size: 40.sp,)
                ),
            
                 ),SizedBox(height: 79.h,),
           Text('Forgot Password',style: TextStyle(color: AppColors.color3,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                 SizedBox(height: 18.h,),
                 Padding(
            padding: const EdgeInsets.only(left: 92),
            child: Image.asset(AppImages.Image2),
           
                 ),
                 SizedBox(height: 26.h,),
                 CommonTextfield(  validator: (Value) {
                          if (Value ==''|| Value==null) {
                            return 'Please entre your email';
                          }return null;
                        },

                  hintText: 'Forgot Password', controller: emailController),
           SizedBox(height: 45.h,),
                 Commonbutton(title: 'Forgot Password', onTap: ()async{ 
               

                    if (_formKey.currentState!.validate()) {
                       await FirebaseAuth.instance
               .sendPasswordResetEmail(email: emailController.text);
                                Get.to(SigninScreen());
                        }

           
                 })
                 ]),
         ),
       )
    );
  }
}