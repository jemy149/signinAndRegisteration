import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workos/screens/auth/login.dart';
import 'package:workos/screens/tasks_screen.dart';
import 'package:workos/user_state.dart';
// import 'package:workos_english/screens/tasks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          }else if (snapshot.hasError){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('an error has been occured'),
                  ),
                ),
              ),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter workos',
            theme: ThemeData(
              // scaffoldBackgroundColor: Color(0xFFEDE7DC),
              scaffoldBackgroundColor: Colors.blueGrey,
              primarySwatch: Colors.blue,
            ),
            home: UserState(),
          );
        });
  }
}
