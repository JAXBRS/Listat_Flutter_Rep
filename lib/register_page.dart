import 'package:flutter/material.dart';
import 'package:listat/sqldb.dart';
import 'package:listat/database_test.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SqlDb sqlDb = SqlDb();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    String email = emailController.text;
    String password = passwordController.text;
    // Add more validation logic here if needed

    int response = await sqlDb.insertData(
        "INSERT INTO listat (email, password) VALUES ('$email', '$password')"
    );

    if (response > 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DatabaseTest()));
    } else {
      // Handle registration failure
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('Registration failed'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF50C2C9),
        title: Text('Register', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              textColor: Colors.white,
              color: Color(0xFF50C2C9),
              onPressed: registerUser,
              child: Text("Register"),
              padding: EdgeInsets.symmetric(vertical: 15.0),
              minWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
