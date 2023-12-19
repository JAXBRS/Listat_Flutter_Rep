import 'package:flutter/material.dart';
import 'package:listat/database_test.dart';
import 'package:listat/sqldb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateList extends StatefulWidget {
  @override
  _CreateListState createState() => _CreateListState();
}

Future<Map<String, String?>> retrieveSharedPreferencesData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');

  return {
    'email': email,
    'password': password,
  };
}

class _CreateListState extends State<CreateList> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController List_name = TextEditingController();
  TextEditingController List_dec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create List',
          style: TextStyle(color: Colors.white), // AppBar title text style
        ),
        backgroundColor: Color(0xFF50C2C9), // AppBar background color
      ),
      body: Container(
        padding: EdgeInsets.all(16.0), // Padding for the container
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    controller: List_name,
                    decoration: InputDecoration(
                      hintText: "List Name",
                      border: OutlineInputBorder(), // Border for TextFormField
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0), // Padding inside the input
                    ),
                  ),
                  SizedBox(height: 15.0), // Spacing between fields
                  TextFormField(
                    controller: List_dec,
                    decoration: InputDecoration(
                      hintText: "List description",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    ),
                  ),
                  SizedBox(height: 20.0), // Spacing before the button
                  MaterialButton(
                    textColor: Colors.white,
                    color: Color(0xFF50C2C9), // Button color
                    onPressed: () async {
                      retrieveSharedPreferencesData().then((values) async {
                        String? email = values['email'];
                        String? password = values['password'];
                        print('Email: $email');
                        print('Password: $password');
                        int response = await sqlDb.insertData('''
                          INSERT INTO listat ('name', 'description')
                          VALUES ("${List_name.text}", "${List_dec.text}")
                          ''');
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => DatabaseTest()),
                            (route) => false,
                          );
                        }
                      });
                    },
                    child: Text("Create List"),
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0), // Button padding
                    minWidth: double.infinity, // Button takes full width
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
