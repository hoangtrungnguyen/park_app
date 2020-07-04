class User{
  String username;
  String password;
  String role  = "";
  User(this.username, this.password);

  bool isValid(){
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  String toString() {
    return 'User{username: $username, password: $password}';
  }
}