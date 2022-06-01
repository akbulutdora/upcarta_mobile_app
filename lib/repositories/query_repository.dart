import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upcarta_mobile_app/models/models.dart';

class QueryRepository {
  QueryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestoreDB;

  Future fetchSearch(String searchKey) async {
    try {
      print("\n\n\nBEFORE QUERYING\n\n\n");
      var querySnapshot = await _firestoreDB
          .collection('Person')
          .where('name', isGreaterThanOrEqualTo: searchKey)
          .where('name', isLessThanOrEqualTo: searchKey + '\uf8ff')
          .get();
      print("\n\n\nAFTER QUERYING\n\n\n");
      if (querySnapshot.docs.isNotEmpty) {
        print("INSIDE IF STATEMENT${querySnapshot.docs.length}");
        List<AppUser> data = querySnapshot.docs.map((value) {
          print(value.data());
          return AppUser.fromJson(value.data());
        }).toList();
        print("\n\n\nAFTER GETTING DATA $data\n\n\n");
        return data;
      }
      return {};
    } catch (e) {
      print('Failed with error code: $e');
      rethrow;
    }
  }
}
