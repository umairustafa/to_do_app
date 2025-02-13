import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_app/view/auth/Splash_screen.dart';
import 'package:to_do_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Required for async calls in main
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
       await GetStorage.init();
       final box = GetStorage();
       if (box.read('OnboardingScreen')==null) {
         box.write('OnboardingScreen',false);
       }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
    
  }
}