import 'dart:developer';

class SignLanguageResponse {
  final String name;
  final List<SignLanguageDetail> details;

  SignLanguageResponse({
    required this.name,
    required this.details,
  });

  factory SignLanguageResponse.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return SignLanguageResponse(
      name: json['name'],
      details: (json['detail_bahasa_isyarat'] as List<dynamic>)
          .map<SignLanguageDetail>((e) => SignLanguageDetail.fromJson(e))
          .toList(),
    );
  }
}

class SignLanguageDetail {
  final String title;
  final String imageURL;

  SignLanguageDetail(this.title, this.imageURL);

  factory SignLanguageDetail.fromJson(Map<String, dynamic> json) {
    return SignLanguageDetail(
      json['title'],
      json['image_url'],
    );
  }
}
