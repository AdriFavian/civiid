import 'package:flutter/material.dart';
import 'package:civiid/Layout/QRScanLayout/QRScanPage.dart';

class AdminScanQR extends StatefulWidget {
  const AdminScanQR({super.key});

  @override
  State<AdminScanQR> createState() => _AdminScanQRState();
}

class _AdminScanQRState extends State<AdminScanQR> {
  @override
  Widget build(BuildContext context) {
    return QRScanPage();
  }
}
