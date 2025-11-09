import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wtf_new_project/provider/user_notifier.dart';
import 'package:wtf_new_project/widgets/custom_textfield.dart';
import 'package:wtf_new_project/widgets/password_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
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
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
              "Create an account to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            CustomTextField(label: "Username", textEditingController: usernameController),
            CustomTextField(label: "Email", textEditingController: emailController),
            PasswordTextfield(label: "Password", textEditingController: passwordController),
            PasswordTextfield(label: "Confirm Password", textEditingController: passwordController),
            
            ElevatedButton(onPressed: (){
            userNotifier.signup(context, usernameController.text, emailController.text);
            }, 
            child: Text("Sign up")),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  Text("Sign up using"),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/facebook.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/x.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/google.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/apple.png", width: 50, height: 50)),
                ],
              ),

            SizedBox(height: 16),

            Row(
              children: [
                Text("Already have an account?"),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed("/login");
                  },
                  child: Text("Login", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
