import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implementasi logika sign out Anda di sini
            Navigator.pop(context);
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}