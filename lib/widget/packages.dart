import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/constants/image_constant.dart';
import 'package:myapp/widget/button.dart';
import 'package:myapp/widget/text.dart';

Widget packagesWidget(BuildContext context, int index, String? title,
    String? price, String? desc) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 36, right: 36, top: 15, bottom: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: index % 2 == 0
            ? HexColor(ColorConstant.containerColor)
            : HexColor(ColorConstant.packageColor)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(title == 'One Day Package'
                  ? ImageConstant.onedayImage
                  : title == 'Three Day Package'
                      ? ImageConstant.threedayImage
                      : title == 'Five Day Package'
                          ? ImageConstant.fivedayImage
                          : ImageConstant.weekdayImage),
              button(
                  'Book Now',
                  index % 2 == 0
                      ? HexColor(ColorConstant.pinkColor)
                      : HexColor(ColorConstant.packageButtonColor),
                  5)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(title ?? '', HexColor(ColorConstant.textColor),
                  FontWeight.w600, 16),
              commonText('₹ $price', HexColor(ColorConstant.textColor),
                  FontWeight.w600, 16)
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 14, top: 8, bottom: 19),
          child: commonText(desc ?? '', Colors.black, FontWeight.w400, 10),
        )
      ],
    ),
  );
}
