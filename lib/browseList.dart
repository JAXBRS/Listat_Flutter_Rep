import 'package:flutter/material.dart';

class browseList extends StatefulWidget {
  const browseList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _browseListState();
  }
}

class _browseListState extends State<browseList> {
  @override
  Widget build(BuildContext context) {
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
              trailing: const Icon(Icons.navigate_next),
            ),
          ),
      ],
    );

    return MaterialApp(
      title: 'Add',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Browse lists'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: listCard),
          ],
        ),
      ),
    );
  }
}
