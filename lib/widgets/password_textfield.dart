import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    super.key,
    this.textEditingController, required String label
  });
  final TextEditingController? textEditingController;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: InkWell(onTap: (){
          setState(() {
            isVisible = !isVisible;
          });
        },child: Icon(isVisible? Icons.visibility : Icons.visibility_off)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      obscureText: !isVisible,
    );
  }
}




