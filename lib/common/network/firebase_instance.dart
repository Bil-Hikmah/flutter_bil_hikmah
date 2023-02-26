import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBilHikmah {
  const FirebaseBilHikmah(this.firestore);

  final FirebaseFirestore firestore;

  factory FirebaseBilHikmah.injection() {
    return FirebaseBilHikmah(FirebaseFirestore.instance);
  }
}
