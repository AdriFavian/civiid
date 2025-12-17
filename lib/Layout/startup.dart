import 'package:civiid/Layout/adminScanQR.dart';
import 'package:civiid/Layout/data/login_info.dart';
import 'package:civiid/Layout/loginPage.dart';
import 'package:civiid/Layout/userGetQR.dart';
import 'package:civiid/services/shared.dart';
import 'package:flutter/material.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoginInfo>(
      future: SharedPrefServiceLogin().checkLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData && snapshot.data!.isLoggedIn) {
          if (snapshot.data!.petugas) {
            return const AdminScanQR();
          } else {
            return const Usergetqr();
          }
        } else {
          return const Loginpage();
        }
      },
    );
  }
}
