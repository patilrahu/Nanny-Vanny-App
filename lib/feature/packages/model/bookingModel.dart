class Bookingmodel {
  final String code;
  final String status;
  final String message;
  final List<ResponseModel> response;

  Bookingmodel({
    required this.code,
    required this.status,
    required this.message,
    required this.response,
  });

  factory Bookingmodel.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<ResponseModel> packagesList = list.map((i) => ResponseModel.fromJson(i)).toList();

    return Bookingmodel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      response: packagesList,
    );
  }
}

class ResponseModel {
   String? title;
   String? from_date;
   String? from_time;
   String? to_date;
   String? to_time;

  ResponseModel({required this.title, required this.from_date, required this.from_time,required this.to_date,required this.to_time});

  factory ResponseModel.fromJson(Map<String, dynamic>? json) {
    return ResponseModel(
      title: json?['title'],
      from_date: json?['from_date'],
      from_time: json?['from_time'],
      to_date: json?['to_date'],
      to_time: json?['to_time'],
    );
  }
}