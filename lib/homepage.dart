import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprftest/viewpage.dart';

import 'firstpage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sharedpreferens'),
        automaticallyImplyLeading: false,
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
          ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final String? lemail = prefs.getString('email');
                final String? lpassword = prefs.getString('password');

                if (lemail == email.text && lpassword == password.text) {
                  await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return firstpage();
                    },
                  ));
                }
              },
              child: Text('Login')),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return viewpage();
                },
              ));
            },
            child: Text(
              'create account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
