import 'package:flutter/material.dart';
import 'package:listat/sqldb.dart';
import 'package:listat/database_test.dart';
import 'register_page.dart'; // Import the RegisterPage
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SqlDb sqlDb = SqlDb();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> validateLogin() async {
    String email = emailController.text;
    String password = passwordController.text;
    List<Map<String, dynamic>> response = await sqlDb.readData(
        "SELECT * FROM listat WHERE email = '$email' AND password = '$password'");

    if (response.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DatabaseTest()));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text('Username or password is incorrect')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF50C2C9),
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              textColor: Colors.white,
              color: Color(0xFF50C2C9),
              onPressed: validateLogin,
              child: Text("Login"),
              padding: EdgeInsets.symmetric(vertical: 15.0),
              minWidth: double.infinity,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}
