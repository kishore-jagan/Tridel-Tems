import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserManagementPwd extends StatefulWidget {
  String fieldPwd;
  bool show;
  TextEditingController controller;
  UserManagementPwd(
      {super.key,
      required this.fieldPwd,
      required this.show,
      required this.controller});

  @override
  State<UserManagementPwd> createState() => _UserManagementPwdState();
}

class _UserManagementPwdState extends State<UserManagementPwd> {
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
            widget.fieldPwd,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        TextField(
          controller: widget.controller,
          obscureText: widget.show ? true : false,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () => setState(() {
                      widget.show = !widget.show;
                    }),
                icon: Icon(
                    widget.show ? Icons.visibility_off : Icons.visibility)),
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
