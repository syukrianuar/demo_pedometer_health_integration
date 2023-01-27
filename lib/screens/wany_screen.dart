
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpbkl/course_list.dart/course_list.dart';
import 'package:kpbkl/screens/notification/notification.dart';
import 'package:kpbkl/utils/constant.dart';
import 'package:kpbkl/screens/signup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant.dart';
import '../model/home_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.001,
          elevation: 0.0,
          backgroundColor: primaryColor),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              // height: Adaptive.h(10),
              width: screenWidth,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Row(
                children: [
                  Align(
                      child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Icon(
                      Icons.person_outline,
                      size: 35,
                      color: Colors.black,
                    ),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KumbhSans'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MUHAMMAD GOHAN\nBIN MUHAMMAD GOKU",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KumbhSans'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'News & Annoucement',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KumbhSans'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'More',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KumbhSans'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                // height: 20,
                width: screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: secondaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 5.0,
                          offset: Offset(0, 0))
                    ]),
                child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Image.asset(
                                'assets/kpbkl_small.png',
                                fit: BoxFit.contain,
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Majlis Menandatangani Memorandum\nPersefahaman (MOU) Antara KPBKL Dan \nMULTIMEDIA UNIVERSITY (MMU)",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Jan 4 2023",
                                    style: TextStyle(
                                        // fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Read More",
                                    style: TextStyle(color: primaryColor
                                        // fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: (() {})),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Students',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KumbhSans'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10),
                  itemCount: HomeMenu.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CourseListScreen();
                              }));
                            } else if (index == 1) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CourseListScreen();
                              }));
                            } else if (index == 2) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CourseListScreen();
                              }));
                            } else if (index == 4) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CourseListScreen();
                              }));
                            } else if (index == 5) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return NotificationScreen();
                              }));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Scaffold(
                                  appBar: AppBar(
                                    backgroundColor: primaryColor,
                                  ),
                                );
                              }));
                            }
                          },
                          child: Container(
                              height: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, //New
                                        blurRadius: 5.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Icon(
                                HomeMenu[index].icon,
                                size: 30,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          HomeMenu[index].HomeName.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Upcoming Events',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KumbhSans'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'More',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KumbhSans'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    // height: 20,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: secondaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ]),
                    child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Image.asset(
                                    'assets/kpbkl_small.png',
                                    fit: BoxFit.contain,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Majlis Menandatangani\nMemorandum Persefahaman\n(MOU) Antara KPBKL Dan \nMULTIMEDIA UNIVERSITY\n(MMU)",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "10:00 AM - 2:00 PM",
                                    style: TextStyle(fontWeight: FontWeight.bold
                                        // fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: (() {})),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, //New
                            blurRadius: 10.0,
                            offset: Offset(-1, -1))
                      ],
                    ),
                    child: Icon(Icons.arrow_forward_rounded),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}