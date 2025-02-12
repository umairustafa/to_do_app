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
  bool _isLoading = false;

  void _handleTap() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulating a process

    setState(() {
      _isLoading = false;
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: _isLoading ? null : _handleTap,
      child: Container(
        height: 44.h,
        width: 220.h,
        decoration: BoxDecoration(
          color: AppColors.color1,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}