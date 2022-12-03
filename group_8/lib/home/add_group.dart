import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: ListView(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
        ],
      )),
    );
  }
}
