import 'package:flutter/material.dart';
import 'package:listat/database_test.dart';
import 'package:listat/sqldb.dart';

class EditList extends StatefulWidget {
  final String List_name;
  final String List_dec;
  final int id;

  EditList({Key? key, required this.List_name, required this.List_dec, required this.id}) : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController List_name = TextEditingController();
  TextEditingController List_dec = TextEditingController();

  @override
  void initState() {
    List_name.text = widget.List_name;
    List_dec.text = widget.List_dec;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF50C2C9),
        title: Text(
          'Edit List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
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
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: List_dec,
                    decoration: InputDecoration(
                      hintText: "List description",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Color(0xFF50C2C9),
                    onPressed: () async {
                      int response = await sqlDb.updateData(
                          '''
                            UPDATE listat SET name = "${List_name.text}", 
                            description = "${List_dec.text}"
                            WHERE id = ${widget.id} 
                          '''
                      );
                      if(response > 0){
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => DatabaseTest()),
                              (route) => false,
                        );
                      }
                    },
                    child: Text("Edit List"),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    minWidth: double.infinity,
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
