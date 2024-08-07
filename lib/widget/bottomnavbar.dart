import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/constants/image_constant.dart';

class Bottomnavbar extends StatefulWidget {
  final Function(int index) onItemSelected;
  Bottomnavbar({super.key, required this.onItemSelected});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        fixedColor: Colors.white,
        currentIndex: selectedIndex,
        items: [
          bottomNavBarItem(ImageConstant.homeImage, 0, 'Home'),
          bottomNavBarItem(ImageConstant.saleImage, 1, 'Packages'),
          bottomNavBarItem(ImageConstant.timeImage, 2, 'Bookings'),
          bottomNavBarItem(ImageConstant.personImage, 3, 'Profile')
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
          widget.onItemSelected(value);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(
      String imageName, int index, String name) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Column(
            children: [
              Image.asset(imageName,
                  height: 22,
                  width: 22,
                  color: selectedIndex == index
                      ? HexColor(ColorConstant.pinkColor)
                      : HexColor(ColorConstant.unselectedColor)),
              Text(
                name,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: selectedIndex == index
                        ? FontWeight.w600
                        : FontWeight.w500,
                    color: selectedIndex == index
                        ? HexColor(ColorConstant.pinkColor)
                        : HexColor(ColorConstant.unselectedColor)),
              ),
              Visibility(
                visible: selectedIndex == index,
                child: Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor(ColorConstant.pinkColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        label: '');
  }
}
