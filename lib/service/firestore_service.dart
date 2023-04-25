import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static Future login(
    String username,
    String password,
  ) async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection('room_user')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();
    if (res.docs.isNotEmpty) {
      Map<String, dynamic> data = res.docs[0].data() as Map<String, dynamic>;
      return data;
    }
    return null;
  }

  static Future register(
    String username,
    String password,
  ) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('room_user');
    var res = await users.add({
      'username': username, // Your ID
      'password': password, // Your password
    });
    return res;
  }
}
