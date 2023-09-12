import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/api/api_service.dart';
import 'package:lms_education/common/sectionHeader.dart';
import 'package:lms_education/common/topBar.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/widgets/contunieCourse.dart';
import 'package:lms_education/widgets/drawerList.dart';
import 'package:lms_education/widgets/leaderboard.dart';
import 'package:lms_education/common/overlay.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/config.dart';
import 'package:lms_education/widgets/videos.dart';
import 'package:lms_education/widgets/planner.dart';
import 'package:lms_education/widgets/videoCard.dart';
import 'package:pausable_timer/pausable_timer.dart';

class Home extends StatefulWidget {
  final onMenuTap;

  Home({this.onMenuTap});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tabNo = 0;
  late bool overlayVisible;
  late bool ispopup = false;
  CupertinoTabController? controller;

  @override
  void initState() {
    overlayVisible = false;
    controller = CupertinoTabController(initialIndex: 0);
    super.initState();
    setState(() {
      initial();
    });
  }

  void initial() async {
    setState(() {
      APIService.getEduList().then((dynamic result) async {
          for (var i = 0; i < result.length; i++) {
            //  violationList.add('1');

            eduTypeList.add(result[i]['edutype'].toString());

            counter = result.length;
          }
          print(idList);
          print(eduTypeList);
          print(titlecatList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CupertinoTabScaffold(
          backgroundColor: colors.secondcolor,
          controller: controller,
          tabBar: CupertinoTabBar(
            onTap: (value) {
              setState(() {
                tabNo = value;
                if (tabNo == 2 || tabNo == 3) {
                  setState(() {
                    issearch = false;
                  });
                } else {
                  issearch = true;
                }
              });
            },
            activeColor: colors.borderColor,
            inactiveColor: colors.progresColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_home_alt), label: 'Anasayfa'),
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_search), label: "Ara"),

              ///             BottomNavigationBarItem(icon: Container()),
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_video), label: "Videolar"),
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_chart), label: "Durum"),
            ],
          ),
          tabBuilder: (context, index) => (index == 0)
              ? HomePage(
                  onMenuTap: widget.onMenuTap,
                )
              : (index == 1)
                  ? PlannerPage(
                      onMenuTap: widget.onMenuTap,
                    )
                  /*    : (index == 2)
                      ? Container(
                          color: CupertinoColors.activeOrange,
                        )*/
                  : (index == 2)
                      ? VideosPage(
                          onMenuTap: widget.onMenuTap,
                        )
                      : LeaderboardPage(
                          onMenuTap: widget.onMenuTap,
                        ),
        ),
        overlayVisible ? OverlayWidget() : Container(),
        /*      Positioned(
            bottom: 3,
            child: Container(
              decoration: BoxDecoration(
                  gradient: Colors().waves,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 25,
                        color: Colors().accentColor(0.6),
                        offset: const Offset(0, 4))
                  ],
                  borderRadius: BorderRadius.circular(500)),
              child: material.FloatingActionButton(
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: material.Colors.transparent,
                  child: overlayVisible
                      ? const Icon(material.Icons.close)
                      : const Icon(BoxIcons.bx_task),
                  onPressed: () {
                    setState(() {
                      overlayVisible = !overlayVisible;
                    });
                  }),
            )),*/
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  final onMenuTap;

  HomePage({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primarycolor,
      drawer: const DrawerList(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.32),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const ContinueCourseCard(long: true);
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SectionHeader(
                    text: 'Önerilen Dersler',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 245,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: counter,
                      itemBuilder: (context, index) {
                        return const VideoCard(long: false);
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SectionHeader(
                    text: 'Revizyon Dersleri',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 245,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const VideoCard(long: false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: TopBar(
              controller: controller,
              expanded: true,
              onMenuTap: onMenuTap,
            ),
          )
        ],
      ),
    );
  }
}
