import 'package:firebase_auth/firebase_auth.dart';
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

class SignUpScreen extends StatefulWidget {
  
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

           child: Column(children: [  
             Padding(
            padding: const EdgeInsets.only(right: 324,top: 32,left: 14),
            
              child: GestureDetector(onTap: () {
                //  Navigator.pop(context,  MaterialPageRoute(builder: (context) => OnboardingScreen(),));
              },
                child: Icon(AppIcons.arrow_circle_left_outlined,size: 40.sp,)
                ),
            
                 ),SizedBox(height: 79.h,),
           Text('Welcome Onboard!',style: TextStyle(color: AppColors.color3,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                 SizedBox(height: 18.h,),
                 Text('Let’s help you meet up your task',style: TextStyle(color: AppColors.color1,fontSize: 19.5.sp,)),
                     SizedBox(height: 30.h,),
                     CommonTextfield( 
                       validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your Full Name';
                      }
                      return null;
                    },

                      hintText: 'Enter your Full Name', controller:nameController),
                     
                     
                     SizedBox(height: 25.h,),


                     CommonTextfield(
                        validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your email';
                      }
                      return null;
                    },

                      hintText: 'Enter your Email address ', controller: emailController),
                    
                    
                     SizedBox(height: 25.h,),


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


                      Commonbutton(title: 'Sign Up ', onTap: ()async{
                   
                 if (_formKey.currentState!.validate()) {


  await   FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                   email: emailController.text,
                   password: PasswordController.text,
                           );
                         Get.to(() => AddTodoScreen());}
                      }),
                       Padding(
                        padding: const EdgeInsets.only(left: 80,top: 40),
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