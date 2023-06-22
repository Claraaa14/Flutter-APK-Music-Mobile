import 'package:flutter/material.dart';
import 'package:ujicoba4/login.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091227),
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFF091227),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),

          ListTile(
            title: Text(
              "Language",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Notification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "About",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Privacy & Social",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Data Server",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Devices",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Audio Quality",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          ListTile(
            title: Text(
              "Voice Quality",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Aksi saat item "Account" diklik
            },
          ),
          const SizedBox(height: 15),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
