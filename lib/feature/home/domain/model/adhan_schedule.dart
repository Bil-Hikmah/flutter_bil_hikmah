import 'dart:convert';

class AdhanSchedule {
  AdhanSchedule({
    required this.imsyak,
    required this.shubuh,
    required this.dzuhur,
    required this.tanggal,
    required this.terbit,
    required this.magrib,
    required this.isya,
    required this.dhuha,
    required this.ashr,
  });

  final String imsyak;
  final String shubuh;
  final String dzuhur;
  final DateTime tanggal;
  final String terbit;
  final String magrib;
  final String isya;
  final String dhuha;
  final String ashr;

  factory AdhanSchedule.fromJson(String str) =>
      AdhanSchedule.fromMap(json.decode(str)[0]);

  factory AdhanSchedule.fromMap(Map<String, dynamic> json) => AdhanSchedule(
        imsyak: json["imsyak"],
        shubuh: json["shubuh"],
        dzuhur: json["dzuhur"],
        tanggal: DateTime.parse(json["tanggal"]),
        terbit: json["terbit"],
        magrib: json["magrib"],
        isya: json["isya"],
        dhuha: json["dhuha"],
        ashr: json["ashr"],
      );
}
