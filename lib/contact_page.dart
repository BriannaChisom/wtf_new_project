import 'package:flutter/material.dart';
import 'package:wtf_new_project/widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
      ),
      
      body: ListView(
        children: [
          Card(
           child: ContactItem()
          )
         
        ],
      ),
    );
  }
}

