import 'package:mansamusaapp/Users/model/user.dart';
import 'package:mansamusaapp/Users/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

}