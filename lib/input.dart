import 'package:flutter/material.dart';

class InputCpu extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;
  const InputCpu({
    super.key,
    required this.hint,
    required this.inputType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 42, right: 42, bottom: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xff333333),
      ),
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
