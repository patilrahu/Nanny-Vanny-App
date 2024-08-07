class ApiResponse {
  final String code;
  final String status;
  final String message;
  final List<Package> response;

  ApiResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.response,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<Package> packagesList = list.map((i) => Package.fromJson(i)).toList();

    return ApiResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      response: packagesList,
    );
  }
}

class Package {
   String? title;
   String? price;
   String? desc;

  Package({required this.title, required this.price, required this.desc});

  factory Package.fromJson(Map<String, dynamic>? json) {
    return Package(
      title: json?['title'],
      price: json?['price'],
      desc: json?['desc'],
    );
  }
}