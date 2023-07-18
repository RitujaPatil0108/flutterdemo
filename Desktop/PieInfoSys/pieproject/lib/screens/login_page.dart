import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pieproject/screens/home_page.dart';
import 'package:pieproject/screens/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const String apiUrl = 'http://192.168.1.220:9999'; 
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<void> login() async {
  //   try {
  //     Map<String,String> body = {
  //       "email":emailController.text,
  //       "pwd":passwordController.text
  //     };
  //     final response = await http.post(Uri.parse('$apiUrl/login'), 
  //     body: body);

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       String token = responseData['token'];

  //       // Save the token in shared preferences for future API requests
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('token', token);

  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Login Successful'),
  //           content: Text('Welcome back!'),
  //           actions: [
  //             ElevatedButton(
  //              onPressed: () {
  //                 Navigator.push(context,
  //                  MaterialPageRoute(builder: (context) => HomePage()));
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Login Failed'),
  //           content: Text('Invalid credentials. Please try again.'),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void navigateToRegistrationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
             // onPressed: () => login(),
             onPressed: (){
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Successful'),
            content: Text('Welcome back!'),
            actions: [
              ElevatedButton(
               onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
             },
              child: Text('Login'),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: navigateToRegistrationPage,
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
