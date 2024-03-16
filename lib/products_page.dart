import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'login_page.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Clear user session by removing the stored credentials
              html.window.localStorage.remove('email');
              html.window.localStorage.remove('password');

              // Navigate to login page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                ModalRoute.withName('/'),
              );
            },
            tooltip: "Log Out",
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/images/notebook.jpg'), 
            title: Text('Notebook'),
            subtitle: Text('Something'),
          ),
          ListTile(
            leading: Image.asset('assets/images/pen.jpg'), 
            title: Text('Pen'),
            subtitle: Text('Something'),
          ),
        ],
      ),
    );
  }
}
