import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  
  final String hint; 
  final TextEditingController controller;
  final TextInputType keyboardType; 

  const CustomInputField({
    Key? key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: TextField(
            controller: controller,
           
            keyboardType: keyboardType,
           
            autofocus: true,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey, width: 0.6),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 128, 124, 124),
                  width: 0.6,
                ),
              ),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
