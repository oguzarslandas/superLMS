import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lms_education/api/api_service.dart';
import 'package:lms_education/constant/constants.dart';
import 'package:lms_education/screens/onboarding.dart';
import 'package:lms_education/widgets/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
 /*   if (newuser == false) {
      Navigator.pushReplacement(
          context,  MaterialPageRoute(builder: (context) => LoginPage()));
    }*/
  }

  void initState() {
    super.initState();
    check_if_already_login();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:  Colors.white, ///Color(0xfff1f1f1),
        body: LayoutBuilder(
          builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          /*    Container(
                                child: Image.asset(
                                  'assets/images/logo.png', height: 60,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  //        color: Colors.white
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),*/
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: const Text(
                                  "Tekrardan seni görmek çok hoş!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 34,
                                      color: Colors.black, fontWeight: FontWeight.w800),
                                ),
                              ),

                              const SizedBox(
                                height: 40,
                              ),
                              /*     Text(
                                'TRUCK DEFENDER',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff236c9f),
                                ),
                              ),*/
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: const TextStyle(color: Colors.black),
                                      controller: _usernamecontroller,
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: "Kullanıcı Adı",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(),
                                      controller: _passwordcontroller,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: "Şifre",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          //  border: Border.all(width: 1, color: Color(0xff236c9f)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[

                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  
                                  APIService.otpLogin(_usernamecontroller.text, _passwordcontroller.text).then((dynamic result) async {
                                    if (result['status'] == true) {
                                      print('Giriş Başarılı!');
                                      print('Hoşgeldin ' + result['returnvalue']['firstname'] +' ' + result['returnvalue']['lastname']);

                                      logindata.setString('firstname', result["returnvalue"]["firstname"]);
                                      logindata.setString('lastname', result["returnvalue"]["lastname"]);
                                      logindata.setString('email', result["returnvalue"]["email"]);
                                      logindata.setString('username', result["returnvalue"]["username"]);
                                      logindata.setString('phone', result["returnvalue"]["phone"]);
                                      logindata.setInt('phone', result["returnvalue"]["id"]);
                                      logindata.setString('role', result["returnvalue"]["role"]);
                                      logindata.setString('deviceid', result['returnvalue']['dealerid']);
                                      logindata.setString('companyid', result['returnvalue']['companyid']);
                                      logindata.setString('companyid', result['returnvalue']['membertype']);
                                      logindata.setBool('login', true);
                                      print('Successfull');
                                      Navigator.pushNamed(context, '/homepage');
                                    }
                                    else {
                                      print('Giriş Bilgilerinizi Kontrol Edip Tekrar Deneyin !');
                                      _showDialog1(result['message']);
                                    }
                                  });
                                },
                         ///       padding: const EdgeInsets.all(16),
                         ///       color: const Color(0xffDDE2E8),
                         /**       shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),*/
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Text(
                                      'Giriş Yap',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    /*  Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showDialog1(String errdesc) {
    showDialog(
      context: context,
      barrierDismissible: false, //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Dikkat!'),
          content: Text(errdesc),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: MaterialButton(
                shape: const StadiumBorder(),
                minWidth: 80,
                color: Colors.red,
                child: const Text(
                  "Kapat",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
