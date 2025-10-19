import 'package:flutter/material.dart';
import 'package:wtf_new_project/notifications_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _profileDetails(),
          _buildDetails(),
          _BuildAccountDetails(),
          
          _BuildSupportDetails(),

          SizedBox(height: 15),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Column _BuildSupportDetails() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Support",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
              title: Text("Help Center", style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("Contact Us", style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        );
  }

  Column _BuildAccountDetails() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
              title: Text(
                "Personal Information",
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("Payment Methods", style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return NotificationsPage();
                  })
                );
              },
              title: Text("Notifications", style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
          ],
        );
  }

  Container _profileDetails() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Image.asset("assets/profile.jpg", width: 100, height: 100),
    );
  }

  Column _buildDetails() {
    return Column(
      children: [
        Text(
          "Brianna Chisom",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),

        Text(
          "chizzygeorge4@gmail.com",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
      ],
    );
  }
}
