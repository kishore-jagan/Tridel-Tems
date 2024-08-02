import 'package:flutter/material.dart';

class UserManagementText extends StatelessWidget {
  final String fieldText;
  final TextEditingController userTextController;

  const UserManagementText(
      {super.key, required this.fieldText, required this.userTextController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            fieldText,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        TextField(
          controller: userTextController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.2),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.lightBlue),
            ),
          ),
        ),
      ],
    );
  }
}
