import 'package:flutter/material.dart';
import 'package:food_app/Core/constants/app_images.dart';
import 'package:food_app/Features/auth/presentation/view/sign_up_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String routeName ="SplashScreen";

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=> SignUpView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        child: Image.asset(AppImages.splash,
            fit: BoxFit.fill),
      ),
    );
  }
}
