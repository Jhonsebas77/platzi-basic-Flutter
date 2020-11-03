import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreAPI();
  void updateUserDataFirestore(User user) =>
      _cloudFirestoreApi.updateUserData(user);
}