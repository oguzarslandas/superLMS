
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_education/screens/SettingScreen.dart';
import 'package:lms_education/screens/course_video.dart';
import 'package:lms_education/screens/lesson_video.dart';
import 'package:lms_education/screens/myDocuments.dart';
import 'package:lms_education/screens/myExams.dart';
import 'package:lms_education/screens/onboarding.dart';
import 'package:lms_education/screens/login_screen.dart';
import 'package:lms_education/screens/splash_screen.dart';
import 'package:lms_education/screens/welcome_screen.dart';
import 'package:lms_education/screens/activeEducation.dart';
import 'package:lms_education/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getLoginStatus() async {
    prefs = await SharedPreferences.getInstance();
 /*   globals.gAuth.googleSignIn.isSignedIn().then((value) {
      prefs.setBool("isLoggedin", value);
    });*/
  }

  @override
  void initState() {
    getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Provider.of<ThemeModel>(context).currentTheme,
      debugShowCheckedModeBanner: false,
 //     home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(),
        '/homepage': (context) => Home(),
        '/settings': (context) => const SettingsPage(),
        '/video': (context) =>   LessonVideoPage(title: '',),
        '/coursevideo': (context) =>   CourseVideoPage(title: '',),
        '/activeedu': (context) =>   ActiveEducation(),
        '/myexams': (context) =>   MyExams(),
        '/mydoc': (context) =>   MyDocuments(),
      },
    );
  }
}