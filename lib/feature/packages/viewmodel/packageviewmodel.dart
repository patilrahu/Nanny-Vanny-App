import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:myapp/api/network_api.dart';
import 'package:myapp/constants/url.dart';
import 'package:myapp/feature/packages/model/packagemodel.dart';

class Packageviewmodel {
  NetworkApi api = NetworkApi();
  List<Package> packageData = [];

  Future<ApiResponse?> getPackageList(BuildContext context) async {
    final packageListData =
        await api.getResponse(Url.baseUrl + Url.getPackageList);
    try {
      final decodeData = ApiResponse.fromJson(packageListData);
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
