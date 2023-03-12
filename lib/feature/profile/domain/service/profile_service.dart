import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';

abstract class ProfileService {
  Future<bool> updateProfileName(String name, String documentID);
}

class ProfileServiceImpl implements ProfileService {
  final FirebaseService firebaseService;

  ProfileServiceImpl(this.firebaseService);

  @override
  Future<bool> updateProfileName(String name, String documentID) async {
    return await firebaseService.updateField(
      {"display_name": name},
      documentID,
    );
  }

  factory ProfileServiceImpl.create() {
    return ProfileServiceImpl(
      FirebaseServiceImplementation.create("users"),
    );
  }
}
