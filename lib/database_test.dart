import 'package:flutter/material.dart';
import 'package:listat/EditList.dart'; // Ensure this path is correct
import 'package:listat/sqldb.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Ensure this path is correct

class DatabaseTest extends StatefulWidget {
  @override
  _DatabaseTestState createState() => _DatabaseTestState();
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

class _DatabaseTestState extends State<DatabaseTest> {
  final SqlDb sqlDb = SqlDb();
  bool isLoading = true;
  List lists = [];

  Future<void> readData() async {
    retrieveSharedPreferencesData().then((values) async {
      String? email = values['email'];
      String? password = values['password'];
      print('Email: $email');
      print('Password: $password');
      List<Map> response =
          await sqlDb.readData("SELECT * FROM listat WHERE email = '$email';");
      lists.clear();
      lists.addAll(response);
    });
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          dynamicCards(),
          cardPadding(context),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'My Lists',
        style: TextStyle(
          color: Color(0xFF3E4462),
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color(0xFF3E4462)),
    );
  }

  Expanded dynamicCards() {
    return Expanded(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : lists.isNotEmpty
              ? ListView.builder(
                  itemCount: lists.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 14.0, left: 17.0, right: 17.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 15.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Stack(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 82.0,
                              height: 82.0,
                              child: Image.network(
                                'image_url_or_asset',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              "${lists[i]['name']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 0, 0, 0.75),
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              "${lists[i]['description']}",
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.75),
                                fontSize: 13,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(left: 16.0, right: 48.0),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: PopupMenuButton<String>(
                              onSelected: (String value) {
                                if (value == 'Edit') {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EditList(
                                        List_name: lists[i]['name'],
                                        List_dec: lists[i]['description'],
                                        id: lists[i]['id'],
                                      ),
                                    ),
                                  );
                                } else if (value == 'Delete') {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Delete'),
                                        content: const Text(
                                            'Are you sure you want to delete this item?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Delete'),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              int response = await sqlDb.deleteData(
                                                  "DELETE FROM listat WHERE id = ${lists[i]['id']}");
                                              if (response > 0) {
                                                readData();
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return {'Edit', 'Delete'}.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                              icon: const Icon(Icons.more_vert),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(child: Text("No data found")),
    );
  }

  Padding cardPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("createlist");
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF50C2C9), // Background color #50C2C9
          minimumSize:
              const Size(double.infinity, 62), // Width 100% - 40px, Height 62px
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: const Text(
          'Create New List',
          style: TextStyle(
            color: Colors.white, // Text color white
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
