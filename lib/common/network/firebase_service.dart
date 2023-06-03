import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseService {
  Future<DocumentReference<Map<String, dynamic>>> addNewDocument(
      Map<String, dynamic> data);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getAllDocument();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getDocumentFilteredWhere(
    String field,
    String value,
  );
  Future<bool> updateField(Map<String, dynamic> field, String documentID);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getLimitDocument(
      int limit);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getPagiantedData(
    int start,
    int limit,
  );
}

class FirebaseServiceImplementation implements FirebaseService {
  final CollectionReference<Map<String, dynamic>> collectionReference;

  FirebaseServiceImplementation(this.collectionReference);

  @override
  Future<DocumentReference<Map<String, dynamic>>> addNewDocument(
      Map<String, dynamic> data) async {
    return await collectionReference
        .add(data)
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }

  Future<void> updateDocument(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      await collectionReference.doc(id).update(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getAllDocument() async {
    try {
      final getData = await collectionReference.get();
      return getData.docs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getDocumentFilteredWhere(
    String field,
    String value,
  ) async {
    try {
      final getData =
          await collectionReference.where(field, isEqualTo: value).get();
      return getData.docs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updateField(
      Map<String, dynamic> field, String documentID) async {
    try {
      return await collectionReference
          .doc(documentID)
          .update(field)
          .then((value) => true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getLimitDocument(
      int limit) async {
    try {
      final getData = await collectionReference.limit(limit).get();
      return getData.docs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getPagiantedData(
    int start,
    int limit,
  ) async {
    try {
      if (start == 0) {
        final getData = await collectionReference.limit(25).get();
        return getData.docs;
      }
      final getData =
          await collectionReference.startAfter([start]).limit(limit).get();
      return getData.docs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  factory FirebaseServiceImplementation.create(String collection) {
    return FirebaseServiceImplementation(
      FirebaseFirestore.instance.collection(collection),
    );
  }
}
