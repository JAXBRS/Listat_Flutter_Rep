import 'package:flutter/material.dart';
import 'createList.dart';
import 'createItem.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyListState();
  }
}

class _MyListState extends State<MyList> {
  final List<String> options = ['new list', 'new item'];

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
            onChanged: (String? newValue) {
              if (newValue == 'new list') {
                // Navigate to CreateList page when 'new list' is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateList()),
                );
              } else if (newValue == 'new item') {
                // Navigate to CreateItem page when 'new item' is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateItem()),
                );
              }
            },
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
                onSelected: (String choice) {
                  // Handle the selected choice
                  print('Selected choice: $choice');
                },
              ),
            ),
          )
      ],
    );

    return Scaffold(
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
    );
  }
}
