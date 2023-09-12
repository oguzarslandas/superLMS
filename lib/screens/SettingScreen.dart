import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lms_education/constant/constants.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/screens/login_screen.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {


  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<SettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late SharedPreferences logindata;
  late String username;
  late String password;
  late String registerid;
  late String adsoyad;
  late String email;
  late String mevki;
  late String profilepic;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
      registerid = logindata.getString('registerid')!;
      profilepic = logindata.getString('profilephoto')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: colors.primarycolor,
        appBar: AppBar(
          backgroundColor: colors.secondcolor,
          actions: [

            PopupMenuButton(
              // add icon, by default "3 dot" icon
                icon: const Icon(Icons.menu_rounded),
                itemBuilder: (context){
                  return [

                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                           Icon(Icons.block, size: 16, color: Colors.red,),
                           Text(
                            ' Engellenmiş Kişiler',
                            style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected:(value){
                  if(value == 0){
              /*      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  /// buradan verileri diğer sayfaya gönder
                            UpdateGamePage()));*/
                  }else if(value == 1){

                  }else if(value == 2){

                  }
                }
            ),

          ],
          title: const FittedBox(
            child: const Text(
              "Ayarlar",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(7.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: colors.primarycolor,
                    border:
                        Border.all(color: colors.borderColor.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(const Radius.circular(5.0))),
             //   height: 238,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: colors.borderColor.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.grey.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://aktiflig.creamobile.com/' + 'profilepic'),
                          )),
                    ),
                    TextButton.icon(
                      icon: Icon(
                        Icons.edit,
                        color: colors.buttonColor,
                        size: 14,
                      ),
                      label: Text(
                        'Düzenle',
                        style: TextStyle(color: colors.buttonColor),
                      ),
                      onPressed: () {
           /*             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profilePage()));*/
                      },
                    ),
                /*    Container(
                        margin: const EdgeInsets.only(left: 7.0),
                        alignment: AlignmentDirectional.center,
                        child: const Text(
                          'oguz.arslandas@creamobile.com',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )),*/
          /*          Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(onPressed: () {
                      /*      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ConfirmPhonePage()));*/
                          },
                              icon: const Icon(Icons.phone_android, size: 16,),
                              label: const Text('Telefon Doğrula')),
                        ),
                        Expanded(
                          child: TextButton.icon(onPressed: () {
                       /*     Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EmailConfirmPage()));*/
                          },
                              icon: const Icon(Icons.mail_outline, size: 16,),
                              label: const Text('E-Posta Doğrula')),
                        ),
                      ],
                    ),*/

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 7.0),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'GENEL',
                    style: TextStyle(
                        color: colors.secondcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(7.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
               //   color: colors.borderColor,
                  border: Border.all(color: colors.borderColor),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),

                width: double.infinity,
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                        color: colors.text2Color,
                      ),
                      label: const Text(
                        'Şifre Değiştir',
                        style: TextStyle(color: colors.text2Color),
                      ),
                      onPressed: () {
                 /*       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordPage()));*/
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.color_lens_outlined,
                        color: colors.text2Color,
                      ),
                      label: const Text(
                        'Tema Değiştir',
                        style: TextStyle(color: colors.text2Color),
                      ),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.star_border_rounded,
                        color: colors.text2Color,
                      ),
                      label: const Text(
                        'Bizi Değerlendirin',
                        style: TextStyle(color: colors.text2Color),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 7.0),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'UYGULAMA HAKKINDA',
                    style: TextStyle(
                        color: colors.secondcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(7.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border:
                        Border.all(color: colors.borderColor),
                    borderRadius: const BorderRadius.all( Radius.circular(5.0))),
                width: double.infinity,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        icon: const Icon(
                          Icons.verified_user_outlined,
                          color: colors.text2Color,
                        ),
                        label: const Text(
                          'Gizlilik Politikası',
                          style: const TextStyle(color: colors.text2Color),
                        ),
                        onPressed: _privacyURL,
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.privacy_tip_outlined,
                          color: colors.text2Color,
                        ),
                        label: const Text(
                          'Kurallar ve Koşullar',
                          style: TextStyle(color: colors.text2Color),
                        ),
                        onPressed: _termsandconditionsURL
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.help_outline_rounded,
                          color: colors.text2Color,
                        ),
                        label: const Text(
                          'Yardım ve Destek',
                          style: TextStyle(
                            color: colors.text2Color,
                          ),
                        ),
                        onPressed: _supportURL
                      ),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.logout_rounded,
                  color: colors.buttonColor,
                ),
                label: Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    color: colors.buttonColor,
                  ),
                ),
                onPressed: () {
                  logindata.setBool('login', false);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage()),
                          (_) => false);

                },
              ),
              const Text(
                'v1.1.0',
                style: TextStyle(color: colors.text3Color),
              )
            ],
          ),
        ));
  }

  Future<void> _privacyURL() async {
    if (!await launchUrl(privacyURL)) {
      throw 'Could not launch $privacyURL';
    }
  }

  Future<void> _termsandconditionsURL() async {
    if (!await launchUrl(termsandconditionsURL)) {
      throw 'Could not launch $termsandconditionsURL';
    }
  }

  Future<void> _supportURL() async {
    if (!await launchUrl(supportURL)) {
      throw 'Could not launch $supportURL';
    }
  }

  Widget buildNavigateButton() => FloatingActionButton(
        child: const Icon(Icons.search),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          setState(() {});
        },
      );
}
