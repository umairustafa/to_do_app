import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/utils/date&time_screen.dart';
import 'package:to_do_app/view/user/add_todo_screen.dart';
import 'package:to_do_app/view/user/profile_screen.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final userid = FirebaseAuth.instance.currentUser!.uid;

  Color getRandomDimColor() {
    return Color.fromARGB(
      25,
      _random.nextInt(100),
      _random.nextInt(500),
      _random.nextInt(307),
    );
  } //Random color f

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
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('userinfo')
                      .doc(userid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return Text('no data Found');
                    } else {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(ProfileScreen(), arguments: {
                                'image': snapshot.data!['image'],
                                'name': snapshot.data!['name'],
                                'email': snapshot.data!['email'],
                              });
                            },
                            child: CircleAvatar(
                              radius: 64,
                              backgroundColor: const Color.fromARGB(255, 205, 204, 204),
                              backgroundImage:
                                  NetworkImage(snapshot.data!['image'] ?? ''),
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Text(
                            'Welcome ${snapshot.data!['name'] ?? ''}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          )
                        ],
                      );
                    }
                  },
                )),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Todo  Tasks.',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28.h,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('todo').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error ${(snapshot.error)}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('no data'));
              }
              return Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                      child: Container(
                        height: 65.h,
                        width: 336.w,
                        child: ListTile(
                          onTap: () {
                            Get.to(DetailScreen(), arguments: {
                              'docId': snapshot.data!.docs[index]['docId'],
                              'title': snapshot.data!.docs[index]['title'],
                              'description': snapshot.data!.docs[index]
                                  ['description'],
                            });
                          },
                          leading: GestureDetector(
                            onTap: () async {
                              final String docId = snapshot
                                  .data!.docs[index]['docId']
                                  .toString();
                              await FirebaseFirestore.instance
                                  .collection('todo')
                                  .doc(docId)
                                  .delete();
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.red,
                              child: Icon(AppIcons.delete),
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docs[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          subtitle: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              snapshot.data!.docs[index]['description']),
                          trailing: Text(DateTimeUtil.formatTime(
                              snapshot.data!.docs[index]['time'])),
                        ),
                        decoration: BoxDecoration(
                            color: getRandomDimColor(),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            AppIcons.add,
            color: AppColors.color2,
            size: 40,
          ),
          shape: CircleBorder(),
          backgroundColor: AppColors.color1,
          onPressed: () {
            Get.to(AddTodoScreen());
          }),
    );
  }
}
