import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LBW System'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the LBW System!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ARAlignmentScreen()),
                );
              },
              child: Text('Start AR Alignment'),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Placeholder for video-based feature
                print('Start Video Mode clicked');
              },
              child: Text('Start Video Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
