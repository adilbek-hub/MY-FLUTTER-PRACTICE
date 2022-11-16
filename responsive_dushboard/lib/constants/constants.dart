import 'package:flutter/material.dart';

final myDefaultBackground = Colors.grey[300];
final myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
);

final myDrawer = Drawer(
  backgroundColor: Colors.red[200],
  child: Column(
    children: const [
      DrawerHeader(child: Icon(Icons.favorite)),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('D U S H B O A R D'),
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text('M E S S A G E'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('S E T T I N G S'),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('L O G O U T'),
      ),
    ],
  ),
);
