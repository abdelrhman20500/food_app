import 'package:flutter/material.dart';


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
    // Future.delayed(const Duration(seconds: 3),(){
    //   Navigator.pushNamed(context, HomeScreen.routeName);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        child: Image.asset("assets/images/splash.png",
            fit: BoxFit.fill),
      ),
    );
  }
}
