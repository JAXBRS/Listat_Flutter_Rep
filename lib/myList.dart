import 'package:flutter/material.dart';
import 'browseList.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyListState();
  }
}

class _MyListState extends State<MyList> {
  final List<String> options = ['new list', 'new item'];
  String? selectedOption;

  int _selectedIndex = 0;

  // Replace the Text widgets with your actual pages
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    browseList(), // Display browseList page when List icon is tapped
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var addButton = Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(3),
          child: DropdownButton<String>(
            hint: const Text(
              'new',
              style: TextStyle(color: Colors.white),
            ),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
          ),
        ),
      ),
    );

    return MaterialApp(
      title: 'My List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My list'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addButton,
            Expanded(child: _widgetOptions[_selectedIndex]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.blue),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.blue),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blue),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page Content'),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Page Content'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page Content'),
    );
  }
}
