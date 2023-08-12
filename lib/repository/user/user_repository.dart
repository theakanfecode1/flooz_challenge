import 'package:flooz_challenge/repository/user/models/user.dart';

class UserRepository {
  User? _user;

  User? getUser()  {
    if (_user != null) return _user;
    return null;
  }

  void setUser(String name,String email)  {
   _user = User(name,email);
  }
}