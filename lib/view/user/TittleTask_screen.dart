import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/view/user/todohome_screen.dart';

class TittletaskScreen extends StatelessWidget {
  const TittletaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [   Padding(
            padding: const EdgeInsets.only(right: 324,top: 32,left: 14),
            
              child: GestureDetector(onTap: () {
                Navigator.pop(context,  MaterialPageRoute(builder: (context) => TodohomeScreen(),));
              },
                child: Icon(AppIcons.arrow_circle_left_outlined,size: 40.sp,)
                ),
            
                 ),SizedBox(height: 40.h
                 ,),
           Padding(
             padding: const EdgeInsets.only(right: 100),
             child: Text('Tittle of your Task',style: TextStyle(color: AppColors.color3,fontWeight: FontWeight.bold,fontSize: 30.sp),),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 14),
             child: Container(
              height: 3.h,
              width: 390,
              color: AppColors.color1,
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('It is a long established fact that a reader \nwill be distracted by the readable content \nof a page when looking at its layout. The \npoint of using Lorem Ipsum is that it has a \nmore-or-less normal distribution of letters,\nas opposed to using Content here, content\n here, making it look like readable English.\n Many desktop publishing packages and \nweb page editors now use Lorem Ipsum as\n their default model text, and a search for \nlorem ipsu will uncove'
             ,style: TextStyle()
             ,),
           )
      ])
    );
  }
}