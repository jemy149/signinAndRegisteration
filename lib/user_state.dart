import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workos/screens/auth/login.dart';
import 'package:workos/screens/tasks_screen.dart';

class UserState extends StatelessWidget {
  const UserState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot){
      if(userSnapshot.data == null){
        print('user is not signed in yet');
        return Login();

      }else if(userSnapshot.hasData){
        print('user is already signed in');

        return TasksScreen();
      }else if (userSnapshot.hasError){
        return Scaffold(body: Center(child: Text('error has been occurred'),),);
      }else if (userSnapshot.connectionState == ConnectionState.waiting){
        return Scaffold(body: Center(child: CircularProgressIndicator(),),);
      }
      return Scaffold(body: Center(child: Text('something went wrong'),),);
    }
    );
  }
}
