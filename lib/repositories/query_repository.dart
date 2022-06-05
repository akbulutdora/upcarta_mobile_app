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

  Future<AppUser> fetchUser(String uid) async {
    try {
      print("\n\nFETCH USER CALLED: $uid");
      var docSnapshot = await _firestoreDB.collection('Person').doc(uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        if (docSnapshot.data()!.isNotEmpty) {
          return AppUser.fromJson(docSnapshot.data()!);
        }
        return AppUser.empty;
      }

      throw "user-fetch-error";
    } catch (e) {
      print("USER FETCH ERROR $e");
      rethrow;
    }
  }

  ///Recommends
  //TODO: sort posts by date
  Future<List<Content>> profileGetRecommends(String uid) async {
    try {
      var docSnapshot = await _firestoreDB.collection('Person').doc(uid).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        var recommendationsID = data['recommendationsID'];
        var recommendationSnapshot = await _firestoreDB
            .collection('collections')
            .doc(recommendationsID)
            .get();
        if (recommendationSnapshot.exists) {
          List<Content> recPostsList = [];
          var postIDs = recommendationSnapshot.data()!['postIDs'];
          for (int i = 0; i < postIDs.length; i++) {
            var recommendationPostSnapshot =
                await _firestoreDB.collection('posts').doc(postIDs[i]).get();
            if (recommendationPostSnapshot.exists) {
              recPostsList
                  .add(Content.fromJson(recommendationPostSnapshot.data()!));
            }
          }
          return recPostsList;
        }
      }
      return [];
    } catch (e) {
      print('Failed with error code: $e');
      //TODO: bu ne return etmeli
      return [];
    }
  }
}
