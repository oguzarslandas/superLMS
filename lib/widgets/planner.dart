
import 'package:lms_education/common/sectionHeader.dart';
import 'package:lms_education/common/topBar.dart';
import 'package:lms_education/theme/box_icons_icons.dart';
import 'package:lms_education/theme/colors.dart';
import 'package:lms_education/theme/config.dart' as config;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/widgets/videoCard.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);
  final Function? onMenuTap;

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primarycolor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.16),
         /*       SliverToBoxAdapter(
                  child: SectionHeader(
                    text: 'Bugün izlemen gereken dersler',
                    onPressed: () {},
                  ),
                ),*/
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.73,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 25,
                      itemBuilder: (context, index) {
                  //      return const VideoCard(long: true);

                        return Card(
                          color: const Color(0xfffafafa), 
                          child: SizedBox(
                          height: 80,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Image.asset('assets/images/play-button.png'),
                                  decoration: BoxDecoration(
                                    color: const Color(0x0ffadadad),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  width: MediaQuery.of(context).size.width * 0.75,
                             //     color: Colors.cyan,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('(48 saat) Kotlin Mobil Uygulama Kursu' , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),),
                                      const SizedBox(height: 5,),
                                      const Text('Oğuz Arslandaş' , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black54),),
                                      const SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              Text('4.7', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.orange),),
                                              SizedBox(width: 5,),
                                              Icon(BoxIcons.bxs_star, size: 12,),
                                              Icon(BoxIcons.bxs_star, size: 12,),
                                              Icon(BoxIcons.bxs_star, size: 12,),
                                              Icon(BoxIcons.bxs_star, size: 12,),
                                              Icon(BoxIcons.bxs_star_half, size: 12,),
                                              SizedBox(width: 5,),
                                              Text('(1.259)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black54),),
                                            ],
                                          ),
                                          const Text('₺299,99', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                        ),);
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 70,
                    child: Text(""),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: TopBar(
              controller: controller,
              expanded: false,
              onMenuTap: widget.onMenuTap,
            ),
          )
        ],
      ),
    );
  }
}
