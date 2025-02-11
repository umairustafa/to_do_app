import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';

class Commonbutton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const Commonbutton({super.key, required this.title, required this.onTap});

  @override
  State<Commonbutton> createState() => _CommonbuttonState();
}

class _CommonbuttonState extends State<Commonbutton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 44.h,
        width: 220.h,
        child: Center(child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
        decoration: BoxDecoration(color: AppColors.color1),
         ),
    );
  }
}