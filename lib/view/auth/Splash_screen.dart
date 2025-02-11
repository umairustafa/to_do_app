import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_app/view/auth/onboarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {

  @override
  void initState() {
    
                    
    super.initState();
    Timer(Duration(seconds: 4) ,(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         
          height: double.infinity,
        width: double.infinity,
    
        decoration: BoxDecoration(
         color: const Color.fromARGB(255, 163, 104, 104)
        ),
         child: Center(child: Text('SplashScreen')),
        ),
    );
  }
}