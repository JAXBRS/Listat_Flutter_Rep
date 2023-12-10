import 'package:flutter/material.dart';
import 'package:listat/db.dart';
import 'package:listat/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

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
  static List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
    Text('Index 3: Settings'),
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

    var listCard = ListView(
      children: [
        for (int index = 1; index < 21; index++)
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: FlutterLogo()),
              title: Text('list name $index'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('list description $index'),
                  const Text('items'),
                ],
              ),
              trailing: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'Delete',
                      child: Text('Delete'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                  ];
                },
                onSelected: (String choice) async {
                  // late Store store;
                  // initObjectBox() async {
                  //   final docDir = await getApplicationDocumentsDirectory();
                  //   store = Store(
                  //     getObjectBoxModel(),
                  //     directory: path.join(docDir.path, 'objectbox'),
                  //   );
                  //   print('saving to ${path.join(docDir.path, 'objectbox')}');
                  // }
                },
              ),
            ),
          )
      ],
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
            Expanded(child: listCard),
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
