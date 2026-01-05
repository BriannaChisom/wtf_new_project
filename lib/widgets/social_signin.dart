import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_new_project/provider/user_notifier.dart';

class SocialSignin extends StatelessWidget {
  const SocialSignin({super.key});

  @override
  Widget build(BuildContext context) {
    var userP = Provider.of<UserNotifier>(context);
    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text("Sign up with"),
            Expanded(child: Divider()),
          ],
        ),

        SizedBox(height: 16),

        // Wrap(
        //   spacing: 10,
        // children: [
        // FlutterSocialButton(buttonType: ButtonType.facebook, onTap: () {}),
        // FlutterSocialButton(buttonType: ButtonType.twitter, onTap: () {}),
        // FlutterSocialButton(buttonType: ButtonType.google, onTap: () {}),
        // FlutterSocialButton(buttonType: ButtonType.apple, onTap: () {}),
        //],
        //), This can also be used.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            GestureDetector(
              onTap: () {
                //userP.signInWithGoogle(context);
              },
              child: Image.asset("assets/facebook.png", width: 50, height: 50),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset("assets/x.png", width: 50, height: 50),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset("assets/google.png", width: 50, height: 50),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset("assets/apple.png", width: 50, height: 50),
            ),
          ],
        ),
      ],
    );
  }
}
