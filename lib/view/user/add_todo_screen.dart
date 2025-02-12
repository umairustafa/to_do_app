import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/sign_up_screen.dart';
import 'package:to_do_app/view/user/todohome_screen.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';
import 'package:to_do_app/widgets/fields/CommonTextField.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
 final TextEditingController titelController = TextEditingController();
 final TextEditingController DescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body:
       SingleChildScrollView(
         child: Form(
          key: _formKey,
           child: Column(children: [   Padding(
            padding: const EdgeInsets.only(right: 324,top: 32,left: 14),
            
              child: GestureDetector(onTap: () {
                Navigator.pop(context,  MaterialPageRoute(builder: (context) => SignUpScreen(),));
              },
                child: Icon(AppIcons.arrow_circle_left_outlined,size: 40.sp,)
                ),
            
                 ),SizedBox(height: 79.h,),
           Text('Welcome Onboard!',style: TextStyle(color: AppColors.color3,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                 SizedBox(height: 18.h,),
                 Padding(
            padding: const EdgeInsets.only(left: 92),
            child: Image.asset(AppImages.Image2),
           
                 ),
                 Text('Add What your want to do later on',style: TextStyle(color: AppColors.color1,fontSize: 15.sp ),),
                 SizedBox(height: 8.h,),
                 CommonTextfield(
                  validator: (Value) {
                          if (Value ==''|| Value==null) {
                            return 'Please entre Title';
                          }return null;
                        },
                  hintText: 'Title', controller: titelController),


           SizedBox(height: 26.h,),


                 CommonTextfield(
                  validator: (Value) {
                          if (Value ==''|| Value==null) {
                            return 'Please entre Description';
                          }return null;
                        },
                  hintText: 'Description', controller: DescriptionController),
            SizedBox(height: 45.h,),
                 Commonbutton(title: 'Add to list ',onTap: (){ 
                    if (_formKey.currentState!.validate()) {
                                Get.to(TodohomeScreen());
                        }
                      }),
                     
           ]),
         ),
       )
    );
  }
}