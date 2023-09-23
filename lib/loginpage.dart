import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Center(
      child: Column(
        children: [
          Text("Welcome", style: TextStyle(fontSize: 32)),
          SizedBox(
            height: 100,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Phone No.'),
          ),
          ElevatedButton(
              onPressed: () {
                authProvider.login();
                MaterialPageRoute(builder: ((context) {
                  return HomePage();
                }));
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
