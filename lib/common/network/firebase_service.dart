import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseService {
  Future<void> addNewDocument(Map<String, dynamic> data);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getAllDocument();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getDocumentFilteredWhere(
    String field,
    String value,
  );
}

class FirebaseServiceImplementation implements FirebaseService {
  final CollectionReference<Map<String, dynamic>> collectionReference;

  FirebaseServiceImplementation(this.collectionReference);

  @override
  Future<void> addNewDocument(Map<String, dynamic> data) async {
    await collectionReference.add(data).catchError(
          (error) => throw Exception(error.toString()),
        );
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

  factory FirebaseServiceImplementation.create(String collection) {
    return FirebaseServiceImplementation(
      FirebaseFirestore.instance.collection(collection),
    );
  }
}
