import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(""
            "User Profile"
        ,style: TextStyle(
            color: Colors.white,
          ),
        ) ,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()
            {
              FirebaseAuth.instance.signOut();
            },
              icon: const Icon(
                Icons.logout,
                size:30,
              )
          ),

        ],
      ),
      body: Center(
        child: Text('User Details Screen',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),),
      ),
    );
  }
}
