import 'package:flutter_bil_hikmah/feature/profile/domain/service/profile_service.dart';

abstract class ProfileRepository {
  Future<bool> updateProfileName(String name, String? documentID);
}

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this.service);

  final ProfileService service;

  @override
  Future<bool> updateProfileName(String name, String? documentID) async {
    if (documentID == null) {
      throw Exception("Document ID is null");
    }
    return await service.updateProfileName(name, documentID);
  }

  factory ProfileRepositoryImpl.create() {
    return ProfileRepositoryImpl(ProfileServiceImpl.create());
  }
}
