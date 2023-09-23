import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washalert/homepage.dart';
import 'loginpage.dart';

void main() async {
  /* SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); */
  WidgetsFlutterBinding.ensureInitialized();
  AuthProvider authProvider = AuthProvider();
  await authProvider.getLoginStatus();
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        /* theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ), */
        home: const AuthChecker(),
      )));
}

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;

  void login() async {
    // Assuming authentication is successful
    isLoggedIn = true;

    // Store login status
    await storeLoginStatus(true);

    notifyListeners();
  }

  Future<void> storeLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text("WashAlert")),
        body: FutureBuilder(
          future: authProvider.getLoginStatus(),
          builder: (context, snapshot) {
            if (authProvider.isLoggedIn) {
              return ChangeNotifierProvider(
                create: (context) => ListModel(),
                child: HomePage(),
              );
            } else {
              return LoginPage();
            }
          },
        ));
  }
}
