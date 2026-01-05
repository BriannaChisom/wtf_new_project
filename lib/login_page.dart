import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wtf_new_project/provider/user_notifier.dart';
import 'package:wtf_new_project/widgets/custom_button.dart';
import 'package:wtf_new_project/widgets/custom_textfield.dart';
import 'package:wtf_new_project/widgets/password_textfield.dart';
import 'package:wtf_new_project/widgets/social_signin.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text(
              "Welcome Back",
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
      
            CustomTextField(label: "Email", textEditingController: emailController),
            SizedBox(height: 16),

            PasswordTextfield(label: "Password", textEditingController: passwordController),
            SizedBox(height: 16),

           CustomButton(text: "Login",
           onPressed: (){
            userNotifier.login(context, 
            emailController.text, 
            passwordController.text);
            Navigator.of(context).pushReplacementNamed("/home");
           }),
            //width: MediaQuery.sizeOf(context).width,
            // These two will enable the ion feet the user's screen.
            //SizedBox(height: 8),

            TextButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed("/forgot");
            }, 
            child: Text("Forgot Password?")),

            SizedBox(height: 16),
            SocialSignin(),

            SizedBox(height: 16),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed("/signup");
                  },
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