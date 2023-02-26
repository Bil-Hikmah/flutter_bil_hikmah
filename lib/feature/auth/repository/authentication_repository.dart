import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bil_hikmah/common/misc/injection.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/feature/auth/repository/bilhikmah_user.dart';

abstract class AuthenticationRepository {
  Future<void> loginAndRegisteredUser(User user);
}

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final FirebaseFirestore firebaseBilHikmah;
  final FirebaseService firebaseService;

  AuthenticationRepositoryImplementation(
    this.firebaseBilHikmah,
    this.firebaseService,
  );

  @override
  Future<void> loginAndRegisteredUser(User user) async {
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>>? searchUser =
          await firebaseService.getDocumentFilteredWhere(
        "email",
        user.email ?? "Unknown",
      );
      final bool isAlreadyData = searchUser != null && searchUser.isNotEmpty;
      if (!isAlreadyData) {
        firebaseService.addNewDocument(
          BilhikmahUser(
            displayName: user.displayName ?? "Unknown",
            email: user.email ?? "Unknown",
            userName: user.displayName ?? "Unknown",
            phoneNumber: user.phoneNumber ?? "Unknown",
            avatarURL: user.photoURL ?? "Unknown",
          ).toJson(),
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  factory AuthenticationRepositoryImplementation.create() {
    return AuthenticationRepositoryImplementation(
      Injection.firebaseBilHikmah.firestore,
      FirebaseServiceImplementation.create("users"),
    );
  }
}
