import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Welcome", style: TextStyle(fontSize: 32)),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Phone No.'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  authProvider.login();
                  MaterialPageRoute(builder: ((context) {
                    return HomePage();
                  }));
                },
                child: Text("Login")),
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}
