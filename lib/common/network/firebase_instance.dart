import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseBilHikmah {
  const FirebaseBilHikmah(
    this.firestore,
    this.fireStorage,
  );

  final FirebaseFirestore firestore;
  final FirebaseStorage fireStorage;

  factory FirebaseBilHikmah.injection() {
    return FirebaseBilHikmah(
      FirebaseFirestore.instance,
      FirebaseStorage.instance,
    );
  }
}
