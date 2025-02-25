import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/view/user/UpdateScreen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              AppIcons.arrow_circle_left_outlined,
              size: 40,
            )),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(Updatescreen(), arguments: {
                  'title': arguments['title'],
                  'description': arguments['description'],
                  'docId': arguments['docId'],
                });
              },
              child: Icon(
                AppIcons.edit,
                size: 35,
              ))
        ],
      ),
      body: 
      Column(children: [
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text(
            arguments['title'],
            style: TextStyle(
                color: AppColors.color3,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          ),
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
          child: Text(
            arguments['description'],
            style: TextStyle(),
          ),
        )
      ]),
    );
  }
}
