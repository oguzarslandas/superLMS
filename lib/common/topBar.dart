import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/theme/config.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    required this.controller,
    required this.expanded,
    required this.onMenuTap,
  }) : super(key: key);

  final TextEditingController controller;
  final bool expanded;
  final onMenuTap;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.secondcolor,
      width: MediaQuery.of(context).size.width,
      height: widget.expanded
          ? MediaQuery.of(context).size.height * 0.35
          : issearch ? MediaQuery.of(context).size.height * 0.19
          : MediaQuery.of(context).size.height * 0.10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(BoxIcons.bx_menu, size: 34, color: Colors.white,),
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Hoşgeldin, Oğuz",
                        style: TextStyle(
                            color: colors.textColor,
                            fontSize: 24,
               //         fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ),
              ],
            ),
          ),
          issearch ? Padding(
            padding: const EdgeInsets.all(15.0),
            child: CupertinoTextField(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                     BoxShadow(
                      blurRadius: 25,
                      offset: Offset(0, 10),
                      color: Color(0x1A636363),
                    ),
                  ]),
              padding: const EdgeInsets.all(10),
              style: const TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 18,
                  fontFamily: 'Red Hat Display'),
              enableInteractiveSelection: true,
              controller: widget.controller,
              expands: false,
              keyboardType: TextInputType.text,
              suffix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  BoxIcons.bx_search,
                  color: Color(0xFFADADAD),
                ),
              ),
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.words,
              placeholder: "Ara",
              placeholderStyle: const TextStyle(
                  color: Color(0xFFADADAD),
                  fontSize: 18,
                  fontFamily: 'Red Hat Display'),
            ),
          ) : const SizedBox.shrink(),
          if (widget.expanded) SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.165,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 10, 30),
                        child: CardWidget(
                          gradient: false,
                          button: true,
                          duration: 200,
                          border: tab == index
                              ? Border(
                                  bottom: BorderSide(
                                      color: tab == 0
                                          ? colors.tabColor
                                          : tab == 1
                                              ? colors.tabColor
                                              : tab == 2
                                                  ? colors.tabColor
                                                  : colors.tabColor,
                                      width: 5),
                                )
                              : null,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  height: 35,
                                  child: Icon(index == 0
                                      ? BoxIcons.bxs_calculator
                                      : index == 1
                                          ? BoxIcons.bx_atom
                                          : index == 2
                                              ? BoxIcons.bx_test_tube
                                              : BoxIcons.bx_dna, color: colors.secondcolor, size: 30,),
                                ),
                                Text(index == 0
                                    ? "Matematik"
                                    : index == 1
                                        ? "Fizik"
                                        : index == 2
                                            ? "Kimya"
                                            : "Biyoloji", style: const TextStyle(color: colors.accentColor),)
                              ],
                            ),
                          ),
                          func: () {
                            setState(() {
                              tab = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ) else Container(),
        ],
      ),
    );
  }
}
