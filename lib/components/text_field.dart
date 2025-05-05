import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // ignore: use_super_parameters
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key); 
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
        style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.grey[900],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
