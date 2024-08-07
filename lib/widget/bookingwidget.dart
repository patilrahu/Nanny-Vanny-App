import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/constants/image_constant.dart';
import 'package:myapp/widget/button.dart';
import 'package:myapp/widget/text.dart';

// ignore: must_be_immutable
class Bookingwidget extends StatefulWidget {
  String title;
  String fromDate;
  String toDate;
  String fromTime;
  String toTime;
  Bookingwidget(
      {super.key,
      required this.title,
      required this.fromDate,
      required this.toDate,
      required this.fromTime,
      required this.toTime});

  @override
  State<Bookingwidget> createState() => _BookingwidgetState();
}

class _BookingwidgetState extends State<Bookingwidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 36, right: 36, top: 15),
      color: Colors.white,
      elevation: 1.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText(widget.title, HexColor(ColorConstant.pinkColor),
                    FontWeight.w500, 16),
                Container(
                  margin: const EdgeInsets.only(left: 22, top: 20, bottom: 20),
                  child: button('Start', HexColor(ColorConstant.pinkColor), 2),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              children: [
                commonText('From', Colors.black, FontWeight.w400, 12),
                const SizedBox(
                  width: 126,
                ),
                commonText('To', Colors.black, FontWeight.w400, 12),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConstant.calendarImage,
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    commonText(
                        widget.fromDate, Colors.black, FontWeight.w500, 16),
                  ],
                ),
                const SizedBox(
                  width: 65,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageConstant.clockImage,
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    commonText(
                        widget.toDate, Colors.black, FontWeight.w500, 16),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConstant.calendarImage,
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    commonText(
                        widget.fromTime, Colors.black, FontWeight.w500, 16),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageConstant.clockImage,
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    commonText(
                        widget.toTime, Colors.black, FontWeight.w500, 16),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 21, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, top: 5, bottom: 5, right: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor(ColorConstant.textColor)),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageConstant.starImage,
                        color: Colors.white,
                        height: 10,
                        width: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      commonText('Rate Us', Colors.white, FontWeight.w500, 12),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, top: 5, bottom: 5, right: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor(ColorConstant.textColor)),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageConstant.pinImage,
                        color: Colors.white,
                        height: 10,
                        width: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      commonText(
                          'Gelocation', Colors.white, FontWeight.w500, 12),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, top: 5, bottom: 5, right: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor(ColorConstant.textColor)),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageConstant.radioImage,
                        color: Colors.white,
                        height: 10,
                        width: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      commonText(
                          'Survillence', Colors.white, FontWeight.w500, 12),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
