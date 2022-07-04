import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upcarta_mobile_app/models/models.dart';

class QueryRepository {
  QueryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestoreDB = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestoreDB;

  Future fetchSearch(String searchKey) async {
    try {

      var querySnapshot = await _firestoreDB
          .collection('Person')
          .where('name', isGreaterThanOrEqualTo: searchKey)
          .where('name', isLessThanOrEqualTo: searchKey + '\uf8ff')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<AppUser> data = querySnapshot.docs.map((value) {
          return AppUser.fromJson(value.data());
        }).toList();
        return data;
      }
      return {};
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUser> fetchUser(String uid) async {
    try {
      var docSnapshot = await _firestoreDB.collection('Person').doc(uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        if (docSnapshot.data()!.isNotEmpty) {
          return AppUser.fromJson(docSnapshot.data()!);
        }
        return AppUser.empty;
      }

      throw 'user-fetch-error';
    } catch (e) {
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
      return [];
    }
  }
}
