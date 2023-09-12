import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/theme/config.dart';
import 'package:lms_education/widgets/contunieCourse.dart';

import '../widgets/activeEducationCard.dart';

class ActiveEducation extends StatefulWidget {
  const ActiveEducation({
    Key? key,
  }) : super(key: key);


  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<ActiveEducation> {
  int tab = 0;
  bool ispopup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primarycolor,
      appBar: AppBar(
        title: Text('Aktif Eğitimlerim'),
        leading: IconButton(
          icon:
          const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: colors.secondcolor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
      /*          SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.32),*/
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return const ActiveEduCard();
                      },
                    ),
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
