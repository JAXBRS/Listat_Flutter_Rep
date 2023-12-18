import 'package:flutter/material.dart';

class CreateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Item'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 207.0,
              margin: const EdgeInsets.only(left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to handle image upload for the item
                },
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
              margin: const EdgeInsets.only(left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Item Title',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: const Color(0xFF484848)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Item Description',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: const Color(0xFF484848)),
                  ),
                ),
              ),
            ),
            Container(
              height: 51.0,
              margin: const EdgeInsets.only(left: 34.0, right: 34.0, top: 14.0, bottom: 14.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to handle form submission for the item
                  Navigator.pop(context); // Navigate back to the previous page
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF50C2C9),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
