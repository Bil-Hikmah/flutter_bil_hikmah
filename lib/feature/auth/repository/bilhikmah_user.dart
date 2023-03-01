class BilhikmahUser {
  String displayName;
  String email;
  String userName;
  String phoneNumber;
  String avatarURL;

  BilhikmahUser({
    required this.displayName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.avatarURL,
  });

  factory BilhikmahUser.fromJson(Map<String, dynamic> json) {
    return BilhikmahUser(
      displayName: json['display_name'],
      email: json['email'],
      userName: json['user_name'],
      phoneNumber: json['phone_number'],
      avatarURL: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'email': email,
      'user_name': userName,
      "phone_number": phoneNumber,
      "avatar_url": avatarURL,
    };
  }
}
