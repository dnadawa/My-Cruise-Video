import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final bool isPassword;
  final IconData icon;

  const InputField({Key key, this.controller, this.hint, this.type, this.isPassword=false, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
  }
}
