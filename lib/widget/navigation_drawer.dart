import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatefulWidget {


  @override
  _mydrawerState createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(elevation: 16.0,
      child:ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),),
    );
  }
}
