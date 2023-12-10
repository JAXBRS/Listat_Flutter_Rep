import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateList extends StatefulWidget {
  @override
  _CreateListState createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create List'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 207.0,
              margin: const EdgeInsets.only(
                  left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: ElevatedButton(
                onPressed: _getImage,
                child: const Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: const EdgeInsets.only(
                  left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'List Title',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: const Color(0xFF484848),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: const Color(0xFF484848),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'List Description',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: const Color(0xFF484848),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: const Color(0xFF484848),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            if (_image != null)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                ),
              ),
            Container(
              height: 51.0,
              margin: const EdgeInsets.only(
                  left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to handle form submission
                  // For example, you can save the list details and uploaded image
                  Navigator.pop(context);
                },
                child: const Text(
                  'Create List',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF50C2C9), // #50C2C9 color
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.zero,
                  side: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
