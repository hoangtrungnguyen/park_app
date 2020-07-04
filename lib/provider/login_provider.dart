import 'package:flutter/cupertino.dart';
import 'package:parkapp/model/user.dart';
import 'package:parkapp/network/network.dart';

class Role{
  String name;
}


class LoginProvider extends ChangeNotifier {
  User nguoidung = User('', '');
  bool isLoading = false;

//  Hàm này để authenticate user
  Future<bool> authenticate() async {
    try {
      if (!nguoidung.isValid()) {
        return false;
      }
      print(nguoidung.toString());
      isLoading = true;
      notifyListeners();
      //TODO chèn API ở những dòng dưới đây
      String respone = await Network.xacThuc(nguoidung);
      print(respone);
      if(respone == "USER"){
        nguoidung.role = "USER";
        return true;
      } else if (respone == "ADMIN"){
        nguoidung.role = 'ADMIN';
        return true;
      }
      return false;
    } on Exception catch(e){
      return false;
    } finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
