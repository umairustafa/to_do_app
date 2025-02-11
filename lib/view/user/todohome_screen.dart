import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/view/user/TittleTask_screen.dart';

class TodohomeScreen extends StatefulWidget {
  const TodohomeScreen({super.key});

  @override
  State<TodohomeScreen> createState() => _TodohomeScreenState();
}

class _TodohomeScreenState extends State<TodohomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            height: 310.h,
            width: 424.w,
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  CircleAvatar(radius: 64,backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage("assets/image04.jpg",),),
                    
                    SizedBox(height: 19.h,),
                    Text('Welcome Fisayom',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)
                ],
              ),
            ),
            decoration: BoxDecoration( color: Colors.blueGrey,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27,right: 241),
            child: Text('Todo  Tasks.',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,),),
          ),SizedBox(height: 28.h,),
          Container(
            height: 65.h,
            width: 336.w,
              child: ListTile(title: Text('Title of your task',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),),subtitle: Text('Description of your task is .....'),trailing: Text('6:45 pm'),),
            
           decoration: BoxDecoration(color: AppColors.color4,borderRadius: BorderRadius.circular(10)),
          ),SizedBox(height: 9.h,),
          Container(
            height: 65.h,
            width: 336.w,
              child: ListTile(title: Text('Title of your task',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),),subtitle: Text('Description of your task is .....'),trailing: Text('5:36 am'),),
            
           decoration: BoxDecoration(color: AppColors.color5,borderRadius: BorderRadius.circular(10)),
          ),SizedBox(height: 9.h,),
          Container(
            height: 65.h,
            width: 336.w, 
              child:  ListTile(title: Text('Title of your task',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),),subtitle: Text('Description of your task is .....'),trailing: Text('3:23 pm'),),
              
            
           decoration: BoxDecoration(color: AppColors.color6,borderRadius: BorderRadius.circular(10)),
          ),

        
        ],
      ),


      floatingActionButton: FloatingActionButton(
        
        child: AppIcons.icon2,
        backgroundColor: AppColors.color1,
        
       onPressed: (){ 
                    
                                Get.to(TittletaskScreen());
                        }),
    );
  }
}