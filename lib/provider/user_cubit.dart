import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_new_project/data/dummy_user_details.dart';
import 'package:wtf_new_project/model/user_details.dart';
import 'package:wtf_new_project/snack_bar_service.dart';

class UserCubit extends Cubit <UserDetails?>{

  UserCubit(): super(null);


  void login (BuildContext context, String email, String password) async {
    print("Go in to login page");
    Future.delayed(Duration (seconds: 2));

    // loggedInUser = USER_DETAILS.where((userDetails) => userDetails.email == email).toList()[0];

    for (var userDetails in USER_DETAILS){
      if (userDetails.email == email && userDetails.password == password) {
       // loggedInUser = userDetails;
        emit(userDetails);
        Navigator.of(context).pushReplacementNamed("/home");
      } else{
        SnackBarService.showSnackBar(context, "Error logging in");
      }
    }

   // notifyListeners();
  }
  void signup (BuildContext context, String username, String email){
   emit(state);
    UserDetails(name: username, profilePicture: "", email: email, password: "");
    USER_DETAILS.add(state!);
    Navigator.pushReplacementNamed(context, "home");

    //notifyListeners();
  }

}