import 'package:dio/dio.dart';

class NetworkApi {
  final dio = Dio();
  Future<dynamic> getResponse(String url) async {
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    }  catch (e) {
      print('Error is: $e');
    }
  }
}