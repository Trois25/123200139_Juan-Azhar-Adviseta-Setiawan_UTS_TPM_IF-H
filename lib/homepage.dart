import 'package:flutter/material.dart';
import 'package:tpm_uts/DayTime.dart';
import 'package:tpm_uts/Tabung.dart';
import 'package:tpm_uts/Trapesium.dart';
import 'package:tpm_uts/loginpage.dart';
import 'package:tpm_uts/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 60,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Text("Profile"),
                ),
              ),
              Container(
                width: 500,
                height: 100,
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Tabung()));
                  },
                  child: Text("Tabung"),
                ),
              ),
              Container(
                width: 500,
                height: 60,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Trapesium()));
                  },
                  child: Text("Trapesium"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 60,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DayTime()));
                  },
                  child: Text("DayTime"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 60,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary:Colors.red,
                  ),
                  child: Text("Log Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

