import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/constants/image_constant.dart';
import 'package:myapp/feature/packages/viewmodel/bookingViewModel.dart';
import 'package:myapp/feature/packages/viewmodel/packageviewmodel.dart';
import 'package:myapp/widget/bookingwidget.dart';
import 'package:myapp/widget/button.dart';
import 'package:myapp/widget/packages.dart';
import 'package:myapp/widget/text.dart';

// ignore: must_be_immutable
class Packages extends StatefulWidget {AdvancedDrawerController drawerController;
   Packages({super.key,required this.drawerController});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  Packageviewmodel packageviewmodel = Packageviewmodel();
  Bookingviewmodel bookingviewmodel = Bookingviewmodel();
 
  @override
  void initState() {
    super.initState();
    context.loaderOverlay.show();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              widget.drawerController.showDrawer();
            },
            child: Container(
                margin: const EdgeInsets.only(right: 30, top: 8),
                alignment: Alignment.centerRight,
                child: Image.asset(
                  ImageConstant.menuImage,
                  height: 35,
                  width: 35,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 36,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset(
                  ImageConstant.profileImage,
                  height: 53,
                  width: 53,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText('Welcome', Colors.black, FontWeight.w700, 16),
                    commonText('Emily Cyrus', HexColor(ColorConstant.pinkColor),
                        FontWeight.w700, 20),
                  ],
                )
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 36, top: 36, right: 36),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor(ColorConstant.containerColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: commonText(
                          'Nanny And \nBabysitting Services',
                          HexColor(ColorConstant.textColor),
                          FontWeight.w800,
                          18),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 22, top: 10, bottom: 20),
                      child: button(
                          'Book Now', HexColor(ColorConstant.textColor), 5),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  ImageConstant.babyImage,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 0),
            child: commonText('Your Current Booking',
                HexColor(ColorConstant.textColor), FontWeight.w700, 20),
          ),
          FutureBuilder(
            future: bookingviewmodel.getCurrentBookingList(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,itemCount: snapshot.data?.response.length,
                    itemBuilder: (context, index) {
                      return Bookingwidget(title: snapshot.data?.response[index].title ?? '', fromDate:  snapshot.data?.response[index].from_date ?? '', toDate:  snapshot.data?.response[index].to_date ?? '', fromTime:  snapshot.data?.response[index].from_time ?? '', toTime:  snapshot.data?.response[index].to_time ?? '');
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text('');
              } else {
                return const Text('');
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 16),
            child: commonText('Packages', HexColor(ColorConstant.textColor),
                FontWeight.w700, 20),
          ),
          FutureBuilder(
            future: packageviewmodel.getPackageList(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,itemCount: snapshot.data?.response.length,
                    itemBuilder: (context, index) {
                      return packagesWidget(
                          context,index,
                         snapshot.data?.response[index].title,
                         snapshot.data?.response[index].price,
                          snapshot.data?.response[index].desc);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text('');
              } else {
                return const Text('');
              }
            },
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
