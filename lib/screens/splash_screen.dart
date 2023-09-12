import 'package:flutter/material.dart';
import 'package:lms_education/screens/lesson_video.dart';
import 'package:lms_education/screens/onboarding.dart';
import 'package:lms_education/screens/welcome_screen.dart';
import 'package:lms_education/widgets/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? false);
    print(newuser);
    if (newuser) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }

  /* Future pageRotate() async {
    Future.delayed(Duration(seconds: 5), () {
      if (SharedPrefs.getLogin) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }*/

  @override
  void initState() {
    super.initState();
    //   pageRotate();
    Timer(const Duration(seconds: 4), () => check_if_already_login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: const AssetImage("assets/images/home.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
            ),
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        //        color: Colors.white
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SpinKitWanderingCubes(
              color: Colors.orange,
              size: 50.0,
              ),
              const SizedBox(
                height: 50,
              )
              /*  Padding(
                    padding: EdgeInsets.only(top: 16,bottom: 32),
                    child: Text(
                      'Şaban Açıkgöz \nİnşaat Malzemeleri',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),*/
            ],
          ),
        )
      ],
    ));
  }
}
