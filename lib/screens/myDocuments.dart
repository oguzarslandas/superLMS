import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_education/theme/colors.dart';


class MyDocuments extends StatefulWidget {
  const MyDocuments({
    Key? key,
  }) : super(key: key);


  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<MyDocuments> {
  int tab = 0;
  bool ispopup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primarycolor,
      appBar: AppBar(
        title: Text('Dosyalarım'),
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
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.89,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 55,
                    itemBuilder: (context, index) {
                      return Card(
                          color: const Color(0xfffafafa),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('belge 1', style: TextStyle(fontFamily: 'Red Hat Display', color: colors.accentColor, fontSize: 16, fontWeight: FontWeight.w600),),
                                  const Text('Kategori 1', style: TextStyle(fontFamily: 'Red Hat Display', color: colors.accentColor, fontSize: 16, fontWeight: FontWeight.w600),),
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
                              ),
                            ),
                          ),
                      );
                    },
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
