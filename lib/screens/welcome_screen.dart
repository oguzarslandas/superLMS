import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lms_education/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomePage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<WelcomePage> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context,  MaterialPageRoute(builder: (context) => Onboarding()));
    }
  }

  void initState() {
    super.initState();
 //   check_if_already_login();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<dynamic> getLogin(String username, String password, ) async {
    final response = await http.post(
      Uri.parse(
          'https://truckdefender.creamobile.com/api/loginmember'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Colors.white, ///Color(0xfff1f1f1),
        body: Container(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Container(
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 180,
                                    height: 120,
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  /*     Text(
                                    'TRUCK DEFENDER',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff236c9f),
                                    ),
                                  ),*/
                                  SizedBox(
                                    height: 250,
                                    child: Image.asset(
                                      'assets/images/home.gif',
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
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                    "Her yaştan öğrenci için eksiksiz E-öğrenme çözümü!\n\n\nHemen ücretsiz Kayıt Olun!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {

                                    },
                             /**       padding: const EdgeInsets.all(16),
                                    color: const Color(0xff0F619F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),*/
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Kayıt Ol',
                                          style: TextStyle(
                                            color: Colors.white,
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
                                const SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
/*
                                      getLogin(_usernamecontroller.text, _passwordcontroller.text).then((dynamic result) async {


                                        if (result['status'] == true) {
                                          print('Giriş Başarılı!');
                                          print('Hoşgeldin ' + result['returnvalue']['firstname'] +' ' + result['returnvalue']['lastname']);

                                          logindata.setString('firstname', result["returnvalue"]["firstname"]);
                                          logindata.setString('lastname', result["returnvalue"]["lastname"]);
                                          logindata.setString('email', result["returnvalue"]["email"]);
                                          logindata.setString('username', result["returnvalue"]["username"]);
                                          logindata.setString('phone', result["returnvalue"]["phone"]);
                                          logindata.setInt('status', result["returnvalue"]["status"]);
                                          logindata.setString('userid', result["returnvalue"]["userid"]);
                                          logindata.setString('role', result["returnvalue"]["role"]);
                                          logindata.setInt('deviceid', result['returnvalue']['device']['id']);
                                          logindata.setString('macid', result['returnvalue']['device']['macid']);
                                          logindata.setString('platenumber', result['returnvalue']['device']['platenumber']);
                                          logindata.setString('information', result['returnvalue']['device']['information']);
                                          logindata.setInt('companyid', result['returnvalue']['companyid']);


                                          if (result['returnvalue']['role'] == 'firm') {
                                            print('Successfull');
                                            logindata.setBool('login', false);
                                            logindata.setString('role', 'firm');
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(onMenuTap: null)));
                                          }
                                        }else{
                                          print('Giriş Bilgilerinizi Kontrol Edip Tekrar Deneyin !');
                                          _showDialog1(result['message']);
                                        }
                                      });*/
                                      Navigator.pushNamed(context, '/login');
                                    },
                            /**      padding: const EdgeInsets.all(16),
                                    color: const Color(0xffDDE2E8),
                                    shape: RoundedRectangleBorder(
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
                ),
              );
            },
          ),
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
