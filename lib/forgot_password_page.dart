import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_input/otp_input.dart';
import 'package:wtf_new_project/widgets/custom_button.dart';
import 'package:wtf_new_project/widgets/custom_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool showOtp = false;
  late Timer timer;
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your Email Address to get an OTP:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            CustomTextField(label: "Email Address"),
            SizedBox(height: 8),
            showOtp ? _buildOtpView() 
            : CustomButton(onPressed:() {
              setState(() {
                showOtp = true;
              });

              Timer.periodic(Duration(seconds: 3), (timer){
                print("Ticked");
                if (seconds <= 1) {
                  timer.cancel();
                }
                setState(() {
                  seconds --;
                });
              });
            }, text: "Get OTP"),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(" Check your email address and input the OTP your received"),
          OtpInputField(
                otpInputFieldCount: 4,
                onOtpEntered: (otp) {
                  print('Entered OTP: $otp');
                  if (otp == "2345"){
                    Navigator.pushNamed(context, "/home");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid OTP")));
                  }
                },
              ),
              // check if seconds == 0, show the user a button for request again. It can be a dummy button 
              Text("$seconds seconds to request an OTP again")
        ],
      ),
    );
  }
}
