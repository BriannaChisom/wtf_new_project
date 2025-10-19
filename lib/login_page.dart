import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text(
              "Get Started",
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Register your details below",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Login"),
            ),
            //width: MediaQuery.sizeOf(context).width,
            // These two will enable the ion feet the user's screen.
            SizedBox(height: 24),
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

            Row(
              spacing: 10,
              children: [
                FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.facebook,
                ),

                FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.twitter,
                ),

                FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.google,
                ),

                FlutterSocialButton(onTap: () {}, buttonType: ButtonType.apple),
              ],
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 10),
                GestureDetector(
                  child: Text("Sign up", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
