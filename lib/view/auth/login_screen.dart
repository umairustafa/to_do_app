import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/view/auth/Signin_screen.dart';
import 'package:to_do_app/view/auth/onboarding_screen.dart';
import 'package:to_do_app/view/user/add_todo_screen.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';
import 'package:to_do_app/widgets/fields/CommonTextField.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController PasswordController = TextEditingController();
 final TextEditingController ConfirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    

final _formKey = GlobalKey<FormState>();
    return Scaffold(backgroundColor: const Color.fromARGB(255, 244, 243, 243),
      body:
       SingleChildScrollView(
         child: Form(
           key: _formKey,

           child: Column(children: [   Padding(
            padding: const EdgeInsets.only(right: 324,top: 32,left: 14),
            
              child: GestureDetector(onTap: () {
                 Navigator.pop(context,  MaterialPageRoute(builder: (context) => OnboardingScreen(),));
              },
                child: AppIcons.icon1),
            
                 ),SizedBox(height: 79.h,),
           Text('Welcome Onboard!',style: TextStyle(color: AppColors.color3,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                 SizedBox(height: 18.h,),
                 Text('Let’s help you meet up your task',style: TextStyle(color: AppColors.color1,fontSize: 19.5.sp,)),
                     SizedBox(height: 39.h,),
                     CommonTextfield( 
                       validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your Full Name';
                      }
                      return null;
                    },

                      hintText: 'Enter your Full Name', controller:nameController),
                     
                     
                     SizedBox(height: 26.h,),


                     CommonTextfield(
                        validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your email';
                      }
                      return null;
                    },

                      hintText: 'Enter your Email address ', controller: emailController),
                    
                    
                     SizedBox(height: 29.h,),


                     CommonTextfield(
                      validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter Create a Password';
                      }
                      return null;
                    },
                      hintText: 'Create a Password', controller: PasswordController),
                     
                     
                     SizedBox(height: 26.h,),


                     CommonTextfield(
                      validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter Confirm your Password';
                      }
                      return null;
                    },
                      hintText: 'Confirm your Password', controller: ConfirmPasswordController),
                    
                    
                     SizedBox(height: 98.h,),


                      Commonbutton(title: 'Sign Up ', onTap: (){
                 if (_formKey.currentState!.validate()) {

                         Get.to(() => AddTodoScreen());}
                      }),
                       Padding(
                        padding: const EdgeInsets.only(left: 80,top: 45),
                        child: Row(
                          children: [
                            Text('Already have an account ? '),
                            GestureDetector(onTap: () {
                      
                        Get.to(() => SigninScreen());
                      
                    

                            },
                              child: Text('Sign In',style:TextStyle(color: AppColors.color1,fontWeight: FontWeight.bold,fontSize: 20.sp) ,))
                          ],
                        ),
                      )
                 
                      ],),
         ),
       )
      
               
                  
    );
  }
}