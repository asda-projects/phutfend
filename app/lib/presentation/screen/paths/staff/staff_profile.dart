import 'package:app/domain/services/crud_users.dart';
import 'package:app/presentation/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class StaffProfileScreen extends StatelessWidget {

  final CrudUsers _crudUsers = CrudUsers();

  StaffProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<User?>(
        future: _crudUsers.currentUser(),
        builder: (context, snapshot) {
        
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3,
                children: [
                  _buildGridTile('User ID', "3-23452-F-6456"),
                  _buildGridTile('Email',  'test@test.com'),
                  _buildGridTile('Display Name',  'Xexeco'),
                  _buildGridTile('Phone Number',  '0923456333'),
                  _buildGridTile('Email Verified',  'Yes'),
                  _buildGridTile('Last Sign In', 'N/A'),
                  _buildGridTile('Creation Time', 'N/A'),
                ],
              ),
            );
          }
      
      ),
    );
  }

  

  Widget _buildGridTile(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}


class StaffProfileScreen_ extends StatelessWidget {

  final CrudUsers _crudUsers = CrudUsers();

  StaffProfileScreen_({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<User?>(
        future: _crudUsers.currentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const LoginScreen(
              redirectErrorMessage: "Sorry, seems has a error. Please try again!",
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const LoginScreen(
              redirectErrorMessage: "Sorry, seems no user is currently signed in, try again!",
            );
          } else {
            User user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3,
                children: [
                  _buildGridTile('User ID', "3-23452-F-6456"),
                  _buildGridTile('Email', user.email ?? 'test@test.com'),
                  _buildGridTile('Display Name', user.displayName ?? 'Xexeco'),
                  _buildGridTile('Phone Number', user.phoneNumber ?? '0923456333'),
                  _buildGridTile('Email Verified', user.emailVerified ? 'Yes' : 'No'),
                  _buildGridTile('Last Sign In', user.metadata.lastSignInTime?.toLocal().toString() ?? 'N/A'),
                  _buildGridTile('Creation Time', user.metadata.creationTime?.toLocal().toString() ?? 'N/A'),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  

  Widget _buildGridTile(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
