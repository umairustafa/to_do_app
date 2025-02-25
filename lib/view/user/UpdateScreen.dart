import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/widgets/button/commonbutton.dart';

class Updatescreen extends StatefulWidget {
  const Updatescreen({super.key});

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final arguments = Get.arguments ?? {};
    titleController.text = arguments['title'] ?? '';
    descriptionController.text = arguments['description'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
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
        ),
        body: Column(children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: TextField(
                controller: titleController,
                style: TextStyle(),
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Container(
              height: 3.h,
              width: 390,
              color: AppColors.color1,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: TextField(
                controller: descriptionController,
                style: TextStyle(),
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          SizedBox(
            height: 29.h,
          ),
          Commonbutton(
            isLoading: isLoading,
            title: 'Update',
            onTap: () async {
              final argument = Get.arguments;
              final String docid = argument['docId'];
   update(docid);
            },
          )
        ]));
  }

  Future update(String docId) async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseFirestore.instance.collection('todo').doc(docId).update({
        'title': titleController.text,
        'description': descriptionController.text,
      });

      Get.back();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }
}
