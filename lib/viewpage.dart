import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create account'),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email',
                hintText: 'Enter mail'),
          ),
          SizedBox(
            height: 35,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
                hintText: 'Enter password'),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                var rmail = email.text;
                var rpassword = password.text;

                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('email', '$rmail');
                await prefs.setString('password', '$rpassword').then((value){
                  print(rmail);
                  print(rpassword);
                });
              },
              child: Text('login'))
        ],
      ),
    );
  }
}
