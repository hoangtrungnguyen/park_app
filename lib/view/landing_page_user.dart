import 'package:flutter/material.dart';
import 'package:parkapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LandingPageUser extends StatefulWidget{
    static String nameRoute = "/LandingPageUser";

    static Route<dynamic> route(){
        return MaterialPageRoute(
            builder: (BuildContext context){
                return LandingPageUser();
            }
        );
    }
    @override
    _LandingPageUserState createState() =>  _LandingPageUserState();
}

class  _LandingPageUserState extends State<LandingPageUser>{
    @override
    Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text("Role:User"),),
          body: Center(child: Text("Tên người dùng ${Provider.of<UngdungProvider>(context,listen: false).nguoidunghientai.username}"),),
        );
    }
}