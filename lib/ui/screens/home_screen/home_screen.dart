import 'package:education/constants/color_constants.dart';
import 'package:education/constants/image_constants.dart';
import 'package:education/ui/screens/home_screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetWidget<HomeController> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: DefaultTabController(
                    length: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1.5,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            )
                          ]),
                      child: TabBar(
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff092136),
                          ),
                          tabs: [
                            Tab(
                              text: 'Problem',
                            ),
                            Tab(
                              text: 'Code',
                            ),
                            Tab(
                              text: 'Theory',
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                          fontSize: 16.0,
                        )),
                        decoration: InputDecoration(
                          hintText: "Type your Question",
                          suffixIcon: Icon(
                            Icons.keyboard_voice_outlined,
                            color: Colors.grey[700],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image:AssetImage(Images.google),),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                              child: Image.asset(
                                Images.camera,
                              ),),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image:AssetImage(Images.google),),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                              child: Image.asset(
                                Images.gallery,
                              ),),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Material(
                          elevation: 5.0,
                          color: Color(0xff092136),
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                              onPressed: () {},
                              minWidth: 132.0,
                              height: 56.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.search_outlined,
                                    color: Colors.white,
                                  ),
                                  Text('Search',
                                      style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      )))
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.solution1),color: Color(0xff092136)),
            activeIcon: ImageIcon(AssetImage(Images.solution),color: Color(0xff092136)),
            label: 'Solutions',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.history),color: Color(0xff092136)),
            activeIcon: ImageIcon(AssetImage(Images.history)),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.studymaterial),color: Color(0xff092136)),
            activeIcon: ImageIcon(AssetImage(Images.studymaterial1)),
            label: 'Study Material',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.more,),color: Color(0xff092136),),
            activeIcon: ImageIcon(AssetImage(Images.more1)),
            label: 'More',
          ),
        ],

      ),
    );
  }
}
