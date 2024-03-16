import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'products_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Retrieve credentials from localStorage with null checks
    String? storedEmail = html.window.localStorage['email'];
    String? storedPassword = html.window.localStorage['password'];

    // Check if the retrieved credentials are not null and then compare
    if (storedEmail != null && storedPassword != null && email == storedEmail && password == storedPassword) {
      // Navigate to ProductsPage on success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductsPage()),
      );
    } else {
      // Show an error message if credentials don't match or are not found
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid email or password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('Log In'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
