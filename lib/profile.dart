import 'package:flutter/material.dart';
import 'package:tpm_uts/homepage.dart';
import 'package:tpm_uts/profiledetile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Menu"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>HomePage()));
              },
              icon: Icon(Icons.navigate_before))
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/another-profile.jpg',
                  height: 200,),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text("Juan Azhar Adviseta Setiawan",
                  style: TextStyle(fontSize: 18),),
              ),
              Container(
                child: Text("123200139",style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 15),
              Container(
                child: ElevatedButton(
                  onPressed:(){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfileDetile()));
                  },
                  child: Text('Show More'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
