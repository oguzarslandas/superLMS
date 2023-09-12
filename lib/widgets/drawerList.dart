import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/global/global.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/theme/config.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({
    Key? key,
  }) : super(key: key);


  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<DrawerList> {
  int tab = 0;
  bool ispopup = false;
  bool ispopupfolders = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
          ),
          backgroundColor: colors.primarycolor,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.progresColor)),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            ispopup = !ispopup;
                          });
                        },
                        title: Row(
                          children: const [
                            Icon(BoxIcons.bx_book, color: colors.text2Color,),
                            SizedBox(width: 5),
                            Text(
                              'Eğitimlerim',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Red Hat Display',
                                  color: colors.text2Color),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          ispopup ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                          size: 28,
                        ),
                      ),
                    ),
                    ispopup ? _buildEducationList() : const SizedBox.shrink(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.progresColor)),
                      child: ListTile(
                        //    leading: Icon(BoxIcons.bx_edit),
                        title: Row(
                          children: const [
                            Icon(BoxIcons.bx_pen, color: colors.text2Color,),
                            SizedBox(width: 5),
                            Text(
                              'Sınavlarım',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Red Hat Display',
                                  color: colors.text2Color),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 28,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/myexams');
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0, color: colors.progresColor)),
                      child: ListTile(
                        //    leading: Icon(BoxIcons.bx_edit),
                        onTap: () {
                          setState(() {
                            ispopupfolders = !ispopupfolders;
                          });
                        },
                        title: Row(
                          children: const [
                            Icon(BoxIcons.bx_file, color: colors.text2Color,),
                            SizedBox(width: 5),
                            Text(
                              'Belgeler',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Red Hat Display',
                                  color: colors.text2Color),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          ispopupfolders ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                          size: 28,
                        ),
                      ),
                    ),
                    ispopupfolders ? _buildFoldersList() : const SizedBox.shrink()
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: colors.progresColor,
                endIndent: 0,
                indent: 0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(BoxIcons.bx_cog, size: 36, color: colors.secondcolor,),
                        const Text('Ayarlar', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Red Hat Display',
                            color: colors.progresColor),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(BoxIcons.bx_power_off, size: 36, color: colors.secondcolor,),
                        const Text('Çıkış Yap', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Red Hat Display',
                            color: colors.progresColor),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildEducationList() {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView(
        children: [
          const ListTile(
            //    leading: Icon(BoxIcons.bx_edit),
            title: Text(
              'Eğitim Kataloğu',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
          const ListTile(
          //  leading: Icon(BoxIcons.bx_calendar),
            title: Text(
              'Eğitim Takvimi',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
          ListTile(
            //    leading: Icon(BoxIcons.bx_edit),
            onTap: () {
              Navigator.pushNamed(context, '/activeedu');
            },
            title: const Text(
              'Aktif Eğitimlerim',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
          const ListTile(
            //    leading: Icon(BoxIcons.bx_edit),
            title: Text(
              'Eğitim Programları',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
          const ListTile(
            //    leading: Icon(BoxIcons.bx_edit),
            title: const Text(
              'Anketler',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  _buildFoldersList() {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView(
        children: [
          ListTile(
            //    leading: Icon(BoxIcons.bx_edit),
            onTap: () {
              Navigator.pushNamed(context, '/mydoc');
            },
            title: const Text(
              'Dosyalar',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
          const ListTile(
            //  leading: Icon(BoxIcons.bx_calendar),
            title: Text(
              'Sertifikalar',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Red Hat Display',
                  color: colors.text2Color),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
