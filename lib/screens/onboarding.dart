
import 'package:flutter/cupertino.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/widgets/home.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int? pageNumber;
  List widgets = [];
  @override
  void initState() {
    pageNumber = 0;
    super.initState();
  }

  void createWidgets() {
    widgets.addAll([
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/1.png'),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Easy access to video lectures, & reading materials.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Red Hat Display',
                  fontSize: 14,
                  color: Color(0xFFFFFFFF)),
            ),
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/2.png'),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Ask questions, earn coins and dominate the global leaderboard.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Red Hat Display',
                  fontSize: 14,
                  color: Color(0xFFFFFFFF)),
            ),
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
       /*   Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "SuperLMS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Red Hat Display',
                  fontSize: 28,
                  color: Color(0xFFFFFFFF)),
            ),
          ),*/
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Her yaştan öğrenci için eksiksiz E-öğrenme çözümü!\n\n\nHemen ücretsiz Kayıt Olun!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Red Hat Display',
                  fontSize: 14,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CupertinoButton(
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Giriş Yap",
                    style: TextStyle(
                        fontFamily: 'Red Hat Display',
                        fontSize: 16,
                        color: Color(0xFF0083BE),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),

             onPressed: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Home()));
              }
              ),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    createWidgets();
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFABDCFF),
                Color(0xFFF8931F),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
      //    Positioned(top: 0, left: 0, child: Image.asset('assets/images/wave.png')),
          Align(
            alignment: Alignment.center,
            child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pageNumber = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => widgets[index]),
          ),
          pageNumber == 2
              ? Container()
              : Positioned(
                  bottom: 10,
                  right: 10,
                  child: CupertinoButton(
                    child: Icon(
                      pageNumber == 1
                          ? BoxIcons.bx_check
                          : BoxIcons.bx_chevron_right,
                      color: Color(0xFFFFFFFF),
                      size: 30,
                    ),
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn);
                    },
                  ))
        ],
      ),
    );
  }
}
