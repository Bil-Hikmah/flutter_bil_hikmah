import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/auth/repository/bilhikmah_user.dart';

abstract class AuthenticationRepository {
  Future<BilhikmahUser> loginAndRegisteredUser(User user);
  Future<bool> updateUserDataGame(
    Map<String, dynamic> data,
    String documentID,
  );
}

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final FirebaseService firebaseService;

  AuthenticationRepositoryImplementation(
    this.firebaseService,
  );

  @override
  Future<BilhikmahUser> loginAndRegisteredUser(User user) async {
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>>? searchUser =
          await firebaseService.getDocumentFilteredWhere(
        "email",
        user.email ?? "Unknown",
      );
      final bool isAlreadyData = searchUser != null && searchUser.isNotEmpty;
      if (!isAlreadyData) {
        final sendingData = await firebaseService.addNewDocument(
          BilhikmahUser(
            displayName: user.displayName ?? "Unknown",
            email: user.email ?? "Unknown",
            userName: user.displayName ?? "Unknown",
            phoneNumber: user.phoneNumber ?? "Unknown",
            avatarURL: user.photoURL ?? "Unknown",
            currentStatusGame: {
              "hitung": 0,
            },
          ).toJson(),
        );
        final data = await sendingData.get().then((value) => value);
        return BilhikmahUser.fromJson(
          data.data()!,
          id: data.id,
        );
      } else {
        final data = BilhikmahUser.fromJson(
          searchUser.first.data(),
          id: searchUser.first.id,
        );
        return data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updateUserDataGame(
    Map<String, dynamic> data,
    String documentID,
  ) async {
    return await firebaseService.updateField(
      {"current_status_game": data},
      documentID,
    );
  }

  factory AuthenticationRepositoryImplementation.create() {
    return AuthenticationRepositoryImplementation(
      FirebaseServiceImplementation.create("users"),
    );
  }
}
