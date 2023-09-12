import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';

class ContinueCourseCard extends StatelessWidget {
  final bool long;

  const ContinueCourseCard({
    required this.long,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: long ? 365 : 180,
        decoration: BoxDecoration(
            color: colors.secondcolor,

          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: long ? 365 : 180,
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/navwave.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
              child: Text(
                "Matematik Eğitimi - Konu 1: Doğal Sayılar",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: colors.textColor,
                    fontFamily: 'Red Hat Display',
                    fontSize: 16),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    //  width: 300,
                    height: 15,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.65,
                        valueColor: AlwaysStoppedAnimation<Color>(colors.progresColor),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                    child: const Text('%65', style: TextStyle(
                        fontSize: 14,
                        color: colors.textColor,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Red Hat Display'),))
              ],
            ),
            const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/coursevideo');
          },
          child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
            child: Text('Kursa Devam Et', style: TextStyle(
                fontSize: 14,
                color: colors.textColor,
                fontWeight: FontWeight.w800,
                fontFamily: 'Red Hat Display'), ),
          ),
        ),
        /*    Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: BoxDecoration(
                      color: colors.buttonColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Icon(BoxIcons.bx_play_circle,
                          color: Colors.white),
                      Text(
                        "Dersi izleyin",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Red Hat Display',
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/video');
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
