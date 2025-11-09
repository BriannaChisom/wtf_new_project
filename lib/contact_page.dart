import 'package:flutter/material.dart';

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
           child: ListTile(
            onTap: (){
              showModalBottomSheet(context: context, 
              showDragHandle: true,
              builder: (context){
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Jam Clinic",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                      Text("No 53, Idu Crescent FCT", textAlign: TextAlign.center),
                      Row(
                        spacing: 24,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.green, size: 40),
                          Icon(Icons.message, color: Colors.blue, size: 40)
                        ],
                      ),
                      Text("History", 
                      style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                      Text("No history yet!", textAlign: TextAlign.center)
                    ],
                  ),
                );
              });
            },
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.shade100,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Icon(Icons.add_box_outlined)
            ),
            title: Text("Clinic Name", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("12 November, 2025")
          )
          )
         
        ],
      ),
    );
  }
}