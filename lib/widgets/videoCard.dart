import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';

class VideoCard extends StatelessWidget {
  final bool long;

  const VideoCard({
    required this.long,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: long ? 360 : 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: long ? 360 : 180,
              height: 87,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/wave.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: const Text('ÜCRETSİZ', style: TextStyle(color: Colors.indigo),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Matematik Eğitimi - Konu 1: Doğal Sayılar",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: colors.text2Color,
                    fontFamily: 'Red Hat Display',
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: const <Widget>[
                  Icon(BoxIcons.bx_bar_chart_alt_2, size: 16),
                  Text(
                    "Başlangıç",
                    style: TextStyle(
                        color: colors.text3Color,
                        fontFamily: 'Red Hat Display',
                        fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "12 dk",
                    style: TextStyle(
                        color: colors.text3Color,
                        fontFamily: 'Red Hat Display',
                        fontSize: 12),
                  ),
                  Icon(BoxIcons.bx_timer, size: 16),
                ],
              ),
            ),
            const Spacer(),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
