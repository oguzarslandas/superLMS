import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';

class MyExamsCard extends StatelessWidget {
//  final bool long;

  const MyExamsCard({
//    required this.long,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfffafafa),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: MediaQuery.of(context).size.width * 0.75,
                //     color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Matlab' , style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Red Hat Display', fontSize: 16),),
                        Text('Puan: 80' , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Red Hat Display', color: colors.text2Color),),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: colors.secondcolor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colors.secondcolor
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Geçme Notu: 60', style: TextStyle(fontFamily: 'Red Hat Display', color: colors.textColor),),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {

                          },
                          child: const Text('Detay', style: TextStyle(fontFamily: 'Red Hat Display'),),
                          style: OutlinedButton.styleFrom(
                            primary: colors.secondcolor,
                            side: BorderSide(color: colors.secondcolor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),);
  }
}
