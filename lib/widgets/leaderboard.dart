
import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/topBar.dart';
import 'package:lms_education/constant/constants.dart';
import 'package:lms_education/screens/login_screen.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderboardPage extends StatefulWidget {
  LeaderboardPage({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);
  final Function? onMenuTap;

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  TextEditingController controller = TextEditingController();
  late bool local;

  @override
  void initState() {
    local = true;
    initial();
    super.initState();
  }

  late SharedPreferences logindata;
  late String username;
  late String password;
  late String registerid;
  late String adsoyad;
  late String email;
  late String mevki;
  late String profilepic;


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
    return Scaffold(
      backgroundColor: colors.primarycolor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: local
                ? _buildProfile()
                : CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate:
                    SliverChildListDelegate.fixed([Container()]),
                    itemExtent:
                    MediaQuery.of(context).size.height * 0.23),
                SliverToBoxAdapter(
                  child: Stack(
                    children: <Widget>[

                    ],
                  ),
                ),
              ],
            )
          ),
          Positioned(
            top: 0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TopBar(
                      controller: controller,
                      expanded: false,
                      onMenuTap: widget.onMenuTap,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      color: colors.primarycolor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  local = true;
                                });
                              },
                              child: const Text(
                                "Profil",
                                style: TextStyle(
                                    color: colors.accentColor,
                                    fontSize: 20,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  local = false;
                                });
                              },
                              child: const Text(
                                "Eğitimler",
                                style: TextStyle(
                                    color: colors.accentColor,
                                    fontSize: 20,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: AnimatedContainer(
                    margin: local
                        ? EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.16 - 60)
                        : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.50),
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: 4,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: colors.borderColor,
                        borderRadius: BorderRadius.circular(500)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildProfile() {
    return CustomScrollView(
        slivers: <Widget>[
    SliverFixedExtentList(
    delegate:SliverChildListDelegate.fixed([Container()]),
    itemExtent:MediaQuery.of(context).size.height * 0.12),
    SliverToBoxAdapter(
    child:Column(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.borderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Icon(BoxIcons.bx_cast),
                            SizedBox(
                              width: 2,
                            ),
                            Text('Kurslarım'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.borderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Icon(BoxIcons.bx_certification),
                            SizedBox(
                              width: 2,
                            ),
                            Text('Sertifikalarım'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.borderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Icon(BoxIcons.bx_info_square),
                            SizedBox(
                              width: 2,
                            ),
                            Text('Yönetim Paneli'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.borderColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Icon(BoxIcons.bx_phone_call),
                            SizedBox(
                              width: 2,
                            ),
                            Text('Bize Ulaşın'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
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
    ))]);
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

}
