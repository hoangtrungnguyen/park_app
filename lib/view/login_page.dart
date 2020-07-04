import 'package:flutter/material.dart';
import 'package:parkapp/provider/app_provider.dart';
import 'package:parkapp/provider/login_provider.dart';
import 'package:parkapp/view/landing_page_admin.dart';
import 'package:parkapp/view/landing_page_user.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static String nameRoute = "/LoginPage";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return LoginProvider();
        },
        child: MainContent());
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    Key key,
  }) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  LoginProvider provider;

  @override
  void initState() {
    provider = Provider.of<LoginProvider>(context,
        listen: false); // không muốn nghe thay đổi của
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              onChanged: (value) {
                provider.nguoidung.username = value;
              },
              decoration: InputDecoration(labelText: "Tên đăng nhập"),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                provider.nguoidung.password = value;
              },
              decoration: InputDecoration(labelText: "Mật khẩu"),
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<LoginProvider>(
              builder:
                  (BuildContext context, LoginProvider value, Widget child) {
                if (value.isLoading) {
                  return CircularProgressIndicator();
                } else {
                  return RaisedButton(
                    onPressed: () async {
                      bool isSuccess = await provider.authenticate();
                      if (isSuccess) {
                        Provider.of<UngdungProvider>(context, listen: false)
                            .nguoidunghientai = provider.nguoidung;
                      }
                      if (isSuccess && provider.nguoidung.role == "USER") {
                        print("success");
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return LandingPageUser();
                        }));
                      } else if (isSuccess &&
                          provider.nguoidung.role == "ADMIN") {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return LandingPageAdmin();
                        }));
                      } else {
                        print("Lỗi đăng nhập");
                      }
                    },
                    child: Text("Đăng nhập"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
