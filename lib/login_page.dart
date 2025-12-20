import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wtf_new_project/provider/user_cubit.dart';
import 'package:wtf_new_project/widgets/custom_textfield.dart';
import 'package:wtf_new_project/widgets/password_textfield.dart';


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
    var userNotifier = Provider.of<UserCubit>(context);
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

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                userNotifier.login(context, emailController.text, passwordController.text);
                
                //Navigator.of(context).pushReplacementNamed("/home");
                
              },
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
                  GestureDetector(onTap: (){}, child: Image.asset("assets/facebook.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/x.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/google.png", width: 50, height: 50)),
                  GestureDetector(onTap: (){}, child: Image.asset("assets/apple.png", width: 50, height: 50))

                ],
              ),

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