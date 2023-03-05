class BilhikmahUser {
  String? id;
  String displayName;
  String email;
  String userName;
  String phoneNumber;
  String avatarURL;
  Map<String, dynamic> currentStatusGame;

  BilhikmahUser({
    required this.displayName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.avatarURL,
    required this.currentStatusGame,
    this.id,
  });

  BilhikmahUser copyWith({
    String? displayName,
    String? email,
    String? userName,
    String? phoneNumber,
    String? avatarURL,
    Map<String, dynamic>? currentStatusGame,
    String? id,
  }) {
    return BilhikmahUser(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarURL: avatarURL ?? this.avatarURL,
      currentStatusGame: currentStatusGame ?? this.currentStatusGame,
      id: id ?? this.id,
    );
  }

  factory BilhikmahUser.fromJson(Map<String, dynamic> json, {String? id}) {
    return BilhikmahUser(
      displayName: json['display_name'],
      email: json['email'],
      userName: json['user_name'],
      phoneNumber: json['phone_number'],
      avatarURL: json['avatar_url'],
      currentStatusGame: json['current_status_game'],
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'email': email,
      'user_name': userName,
      "phone_number": phoneNumber,
      "avatar_url": avatarURL,
      "current_status_game": currentStatusGame,
    };
  }
}
