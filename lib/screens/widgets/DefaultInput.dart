import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  DefaultInput({super.key, required this.controller, required this.labelText});

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          decoration: InputDecoration(
              isCollapsed: false,
              filled: true,
              fillColor: Colors.white,
              labelText: widget.labelText),
        ));
  }
}
