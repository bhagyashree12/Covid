import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About me"),
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assests/quuen.jpg"),
              radius: 60.0,
              
              
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              height: 50.0,
            ),
            Text("Hello there , I am Bhagyashree"),
            SizedBox(height: 20.0),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.email,
                ),
                label: Text("bhagyashreesarode97@gmail.com"))
          ],
        ),
      ),
    );
  }
}
