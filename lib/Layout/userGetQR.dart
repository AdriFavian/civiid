import 'package:civiid/Layout/TheFinalLayout.dart';
import 'package:civiid/Layout/loginPage.dart';
import 'package:civiid/services/UserAPIservices.dart';
import 'package:civiid/services/shared.dart';
import 'package:civiid/widget/TheBestButtonWidget.dart';
import 'package:flutter/material.dart';

class Usergetqr extends StatefulWidget {
  const Usergetqr({super.key});

  @override
  State<Usergetqr> createState() => _UsergetqrState();
}

class _UsergetqrState extends State<Usergetqr> {
  String qrCode = '';

  void initState() {
    super.initState();
    getQRCode();
  }

  void logout(BuildContext context) {
    SharedPrefServiceLogin().clearLoginData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Loginpage()),
      (route) => false,
    );
  }

  void getQRCode() async {
    try {
      String token = await SharedPrefServiceLogin().getLoginData();
      String result = await QRCodeAPI().getQRCode(token);
      if (result.contains('error')) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result)));
      } else {
        setState(() {
          qrCode = result;
        });
      }
      print(result);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TheFinalLayout(
      title: 'QR Code Anda',
      subtitle:
          'Silahkan tunjukkan QR Code Anda kepada petugas untuk dipindahi.',
      children: [
        qrCode.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Center(child: Image.network(qrCode)),
        SizedBox(height: 20),
        TheBestButtonWidget(
          color: const Color.fromARGB(255, 56, 92, 221),
          label: 'Logout',
          onPressed: () {
            logout(context);
          },
          colorText: Colors.white,
        ),
      ],
    );
  }
}
