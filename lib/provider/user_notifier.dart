import 'package:flutter/material.dart';
import 'package:wtf_new_project/data/dummy_user_details.dart';
import 'package:wtf_new_project/model/user_details.dart';

class UserNotifier extends ChangeNotifier{

  UserDetails? loggedInUser;

  void login (BuildContext context, String email, String password) async {
    print("Go in to login page");
    Future.delayed(Duration (seconds: 2));

    // loggedInUser = USER_DETAILS.where((userDetails) => userDetails.email == email).toList()[0];

    for (var userDetails in USER_DETAILS){
      if (userDetails.email == email && userDetails.password == password) {
        loggedInUser = userDetails;
        Navigator.of(context).pushReplacementNamed("/home");
      }
    }

    notifyListeners();
  }
  void signup (BuildContext context, String username, String email){
    loggedInUser = UserDetails(name: username, profilePicture: "", email: email, password: "");
    USER_DETAILS.add(loggedInUser!);
    Navigator.pushReplacementNamed(context, "home");

    notifyListeners();
  }

}