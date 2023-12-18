import 'package:flutter/material.dart';
import 'package:listat/sqldb.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Save to Local Storage',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SqlDb sqlDb = SqlDb();

  Future<void> saveToLocalStorage() async {
    final List<Map<String, dynamic>> users = await sqlDb.readData(
        "SELECT * FROM listat WHERE email = 'your_email_value' AND password = 'your_password_value';");

    if (users.isNotEmpty) {
      await validUser();
    } else {
      invalidUser();
    }
  }

  void invalidUser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Credentials'),
          content: const Text('Your email or password is invalid.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> validUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
    print('Data saved to local storage');

    // Retrieve and print the saved data
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    print('Saved Email: $savedEmail');
    print('Saved Password: $savedPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarContent(),
      body: centerContent(),
    );
  }

  AppBar appbarContent() {
    return AppBar(
      title: const Text('Login Page'),
    );
  }

  Center centerContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: saveToLocalStorage,
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
