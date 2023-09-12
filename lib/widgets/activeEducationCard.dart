import 'package:flutter/cupertino.dart';
import 'package:lms_education/common/card.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';

class ActiveEduCard extends StatelessWidget {
//  final bool long;

  const ActiveEduCard({
//    required this.long,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfffafafa),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset('assets/images/navwave.png', fit: BoxFit.cover,),
              decoration: BoxDecoration(
                color: colors.secondcolor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width * 0.75,
                //     color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Kotlin Mobil Uygulama Kursu' , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),),
                    const SizedBox(height: 5,),
                    const Text('Oğuz Arslandaş' , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black54),),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                            //  width: 300,
                            height: 8,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(const Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.65,
                                valueColor: const AlwaysStoppedAnimation<Color>(colors.progresColor),
                                backgroundColor: colors.primarycolor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text('%65', style: TextStyle(fontFamily: 'Red Hat Display', color: colors.text2Color)),
                        )
                      ],
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
                            child: Text('Zorunlu', style: TextStyle(fontFamily: 'Red Hat Display', color: colors.textColor),),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: OutlinedButton(
                              onPressed: () {

                                },
                            child: const Text('Detay'),
                            style: OutlinedButton.styleFrom(
                              primary: colors.secondcolor,
                              side: BorderSide(color: colors.secondcolor),
                            ),
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
