import 'package:flutter/material.dart';
import 'package:tpm_uts/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  //late String username, password (bisa kosong dan baru bisa diakses ketika sudah diisi)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Column(
            children: [
              _usernameField(),// _ menandakan kalau itu private
              _passwordField(),
              _loginButton(),
            ],
          ),
        )
    );
  }
  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:10 ,horizontal:20 ),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(
                  color: (username == "juan")?Colors.lightGreenAccent:Colors.red
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(color: (username == "juan")?Colors.lightGreenAccent:Colors.red)
          ),
        ),
      ),
    );
  }
  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:10 ,horizontal:20 ),
      child: TextFormField(
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(
                  color: (password == "123200139")?Colors.lightGreenAccent:Colors.red
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(color: (isLoginSuccess)?Colors.lightGreenAccent:Colors.red)
          ),
        ),
      ),
    );
  }
  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            String text = "";
            if(username == "juan" && password == "123200139"){
              setState(() { //menggenerate ulang tampilan
                isLoginSuccess = true;
                text = "Login bergasil";
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            }else if(username == "juan"){
              setState(() {
                text = "Login Gagal, password salah";
              });
            }else if(password == "123200139"){
              setState(() {
                text = "Login Gagal, username salah";
              });
            }
            else{
              setState(() {
                isLoginSuccess = false;
                text = "Akun tidak ditemukan";
              });
            }
            SnackBar snackBar = SnackBar(content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Login')
      ),
    );
  }

}
