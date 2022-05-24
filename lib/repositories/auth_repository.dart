import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/models/auth_user.dart';
import 'package:upcarta_mobile_app/service/firestore_service.dart';

enum AppStatus { authenticated, unauthenticated, uninitialized, prelanded }

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _controller = StreamController<AppStatus>();

  Stream<AppStatus> get status async* {
    // await Future<void>.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("\nisNULL ${prefs.getBool("authenticated") == null}\n");
    // print("\nisAuthenticated ${!prefs.getBool("authenticated")!}\n");
    if (prefs.getBool("landed") == null || !prefs.getBool("landed")!) {
      yield AppStatus.prelanded;
    } else if (prefs.getBool("authenticated") == null ||
        !prefs.getBool("authenticated")!) {
      yield AppStatus.unauthenticated;
    } else {
      yield AppStatus.authenticated;
    }

    yield* _controller.stream;
  }

  AuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var currentUser = AuthUser.empty;

  Stream<AuthUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? AuthUser.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  } //gives all users that are authenticated to the app.

  Future<void> signup({
    required String email,
    required String password,
    required String name,
    required String username,
  }) async {
    try {
      FireStoreService fireStoreService = FireStoreService();
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      fireStoreService.createPerson(user, username, name, email);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("authenticated", true);
    } catch (_) {}
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await Future.delayed(
        const Duration(milliseconds: 500),
        () => _controller.add(AppStatus.authenticated),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("authenticated", true);
    } catch (_) {}
  }

  Future<void> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
      _controller.add(AppStatus.unauthenticated);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("authenticated", false);
    } catch (_) {}
  }

  void dispose() => _controller.close();
}

extension on firebase_auth.User {
  AuthUser get toUser {
    return AuthUser(
      id: uid,
      email: email!,
      name: displayName,
      photoURL: photoURL,
    );
  }
}
