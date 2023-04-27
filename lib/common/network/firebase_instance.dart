import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseBilHikmah {
  const FirebaseBilHikmah(
    this.firestore,
    this.fireStorage,
    this.firebaseAuthentication,
  );

  final FirebaseFirestore firestore;
  final FirebaseStorage fireStorage;
  final FirebaseAuth firebaseAuthentication;

  factory FirebaseBilHikmah.injection() {
    return FirebaseBilHikmah(
      FirebaseFirestore.instance,
      FirebaseStorage.instance,
      FirebaseAuth.instance,
    );
  }
}
