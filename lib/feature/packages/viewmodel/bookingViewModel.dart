import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:myapp/api/network_api.dart';
import 'package:myapp/constants/url.dart';
import 'package:myapp/feature/packages/model/bookingModel.dart';

class Bookingviewmodel {
  
  NetworkApi api = NetworkApi();

  Future<Bookingmodel?> getCurrentBookingList(BuildContext context) async {
    final bookingListData =
        await api.getResponse(Url.baseUrl + Url.getCurrentBookingList);
     
    try {
      final decodeData = Bookingmodel.fromJson(bookingListData);
      // ignore: use_build_context_synchronously
      context.loaderOverlay.hide();
      return decodeData;
    } catch (e) {
      // ignore: use_build_context_synchronously
      context.loaderOverlay.hide();
      print(e);
    }
    return null;
  }

}