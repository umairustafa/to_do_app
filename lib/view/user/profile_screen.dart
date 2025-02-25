import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/view/auth/sign_up_screen.dart';
import 'package:to_do_app/view/user/home_screen.dart';
import 'package:to_do_app/widgets/fields/CommonTextField.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    final argument = Get.arguments;
    nameController.text = argument['name'] ?? '';
    emailController.text = argument['email'] ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 310.h,
            width: 424.w,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: OutlinedButton(
                      onPressed: () =>update(),
                      child: Text('Save',
                          style: TextStyle(
                              color: AppColors.color4,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CircleAvatar(
                    radius: 64,
                    backgroundColor: const Color.fromARGB(255, 198, 200, 201),
                    backgroundImage: NetworkImage(argument['image'])),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text('Edit Profile',
                style: TextStyle(
                    color: AppColors.color1, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(
              inputType: TextInputType.name,
              sufixicon: Icons.edit,
              controller: nameController),
          SizedBox(height: 17.h),
          CommonTextfield(
              inputType: TextInputType.emailAddress,
              controller: emailController),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text('More',
                style: TextStyle(
                  color: AppColors.color1,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 40),
            child: Row(
              children: [
                Icon(AppIcons.PrivacyPolicy),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 40),
            child: Row(
              children: [
                Icon(AppIcons.Terms),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 40),
            child: GestureDetector(
              onTap: () async{
                try {
                   await  FirebaseAuth.instance.signOut();
                Get.to(SignUpScreen());
                Get.snackbar('Succes', 'Logout');
                }on FirebaseException catch (e) {
                   Get.snackbar('Succes', e.toString());
                }
             
              },
              child: Row(
                children: [
                  Icon(
                    AppIcons.logout,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future update() async {
    final String uId = FirebaseAuth.instance.currentUser!.uid;
    try {
       setState(() {
        isLoading = true;
      });

      await FirebaseFirestore.instance.collection('userinfo').doc(uId).update({
        'name': nameController.text,
        // 'image':''
      });
      Get.to(HomeScreen());
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
