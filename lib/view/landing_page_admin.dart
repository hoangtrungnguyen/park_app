import 'package:flutter/material.dart';
import 'package:parkapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LandingPageAdmin extends StatefulWidget {
  static String nameRoute = "/LandingPageAdmin";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return LandingPageAdmin();
    });
  }

  @override
  _LandingPageAdminState createState() => _LandingPageAdminState();
}

class _LandingPageAdminState extends State<LandingPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Role: Admin"),
        ),
        body: Center(
            child: Text(
                "Tên người dùng ${Provider.of<UngdungProvider>(context, listen: false).nguoidunghientai.username}")));
  }
}
