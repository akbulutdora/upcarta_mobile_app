import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcarta_mobile_app/navigation//routes.gr.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);
  @override
  State<Welcome> createState() => _WelcomeState();
  static MaterialPage page() {
    return MaterialPage(
      child: Welcome(),
    );
  }
}
// class MyFirebaseApp extends StatelessWidget {
//   final Future<FirebaseApp> _init = Firebase.initializeApp();
@override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _init,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(
//               child: Text("Error"),
//             ),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Welcome();
//         }
//         return const MaterialApp(
//           home: Center(
//             child: Text("Waiting"),
//           ),
//         );
//       },
//     );
//   }
// }