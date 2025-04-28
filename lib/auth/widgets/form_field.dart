import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormFieldClass extends StatelessWidget {
  late TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  String hittile;
  FormFieldClass({
    super.key,
    required this.controller,
    required this.hittile,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller
      controller: controller,
      // hint
      validator: validator,
      
      keyboardType: keyboardType,
      // Style
      decoration: InputDecoration(
        hintText: hittile,
        hintStyle: TextStyle(color: Colors.blue.shade200),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0.3,
              color: Colors.blue,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0.3,
              color: Colors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.blue,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0.3,
              color: Colors.blue,
            )),
      ),
      // cureser
      cursorColor: Colors.blueAccent,
    );
  }
}
