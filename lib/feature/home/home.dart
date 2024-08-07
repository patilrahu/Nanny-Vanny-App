import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/constants/image_constant.dart';
import 'package:myapp/feature/packages/ui/packages.dart';
import 'package:myapp/widget/bottomnavbar.dart';
import 'package:myapp/widget/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();
  List<String> options = [
    "Home",
    "Book A Nanny",
    "How It Works",
    "Why Nanny Vanny",
    "My Bookings",
    "My Profile",
    "Support"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
      openRatio: 0.5,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      drawer: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 41),
              child: Image.asset(
                ImageConstant.drawerProfile,
                height: 72,
                width: 72,
              ),
            ),
            commonText('Emily Cyrus', HexColor(ColorConstant.pinkColor),
                FontWeight.w700, 24),
            SizedBox(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 38, top: 38, right: 0),
                itemCount: options.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                          options[index],
                          HexColor(ColorConstant.textColor),
                          FontWeight.w500,
                          18),
                      Divider(
                        thickness: 0.2,
                        color: HexColor(ColorConstant.pinkColor),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.122),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Bottomnavbar(
            onItemSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          body: currentIndex == 0
              ? Packages(
                  drawerController: _advancedDrawerController,
                )
              : Center(
                  child: Container(
                  child: commonText(
                      currentIndex == 1
                          ? 'Packages'
                          : currentIndex == 2
                              ? 'Bookings'
                              : 'Profile',
                      HexColor(ColorConstant.pinkColor),
                      FontWeight.w600,
                      15),
                )),
        ),
      ),
    ));
  }
}
