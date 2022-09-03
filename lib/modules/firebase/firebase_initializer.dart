import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer extends StatefulWidget {
  final Widget child;

  const FirebaseInitializer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _FirebaseState createState() => _FirebaseState();
}

class _FirebaseState extends State<FirebaseInitializer> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
