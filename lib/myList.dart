import 'package:flutter/material.dart';
import 'package:listat/db.dart';
import 'db.dart';

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
            // value: selectedOption,
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
                selectedOption = selectedOption;
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
                onSelected: (String choice) async {},
              ),
            ),
          )
      ],
    );

    return MaterialApp(
      title: 'Add',
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
      ),
    );
  }
}
