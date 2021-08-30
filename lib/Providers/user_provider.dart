import 'package:burgerjoint/Models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {

  User user = new User.loggedIn("","","","",0);
  void userLoggedIn(User loggedInUser){
    user= loggedInUser;
    notifyListeners();
  }

}