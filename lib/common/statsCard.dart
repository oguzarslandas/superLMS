
import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/theme/config.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: BoxDecoration(color: colors.primarycolor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "3489",
                            style: TextStyle(
                                fontFamily: 'Red Hat Display',
                                fontSize: 18,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Image.asset(
                          'assets/images/CoinSmall.png',
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
          /*        Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VideoPage(),
                    ),
                  );*/
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Statistics",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Color(0xFF535353),
                    fontFamily: 'Red Hat Display',
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(BoxIcons.bx_question_mark, size: 16),
                  Text(
                    "23 Questions asked",
                    style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    "12 days Streak",
                    style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  Icon(BoxIcons.bxs_flame, size: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(BoxIcons.bx_pen, size: 16),
                  Text(
                    "89 Questions answered",
                    style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    "25 topics revised",
                    style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  Icon(BoxIcons.bx_book_open, size: 16),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
