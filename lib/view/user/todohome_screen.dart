import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/utils/date&time_screen.dart';
import 'package:to_do_app/view/user/add_todo_screen.dart';

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
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage(
                      "assets/image04.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Text(
                    'Welcome Fisayom',
                    style: 
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Todo  Tasks.',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
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
                          EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
                      child: Container(
                        height: 65.h,
                        width: 336.w,
                        child: ListTile(
                          title: Text(
                            snapshot.data!.docs[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          subtitle:
                              Text(snapshot.data!.docs[index]['description']),
                          trailing: Text(DateTimeUtil.formatTime(
                              snapshot.data!.docs[index]['time'])),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.color4,
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
          child: Icon(AppIcons.add),
          backgroundColor: AppColors.color1,
          onPressed: () {
            Get.to(AddTodoScreen());
          }),
    );
  }
}
