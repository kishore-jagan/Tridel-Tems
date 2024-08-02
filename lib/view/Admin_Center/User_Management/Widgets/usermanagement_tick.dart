import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserManagementTick extends StatefulWidget {
  String val;
  bool show;
  UserManagementTick({super.key, required this.val, required this.show});

  @override
  State<UserManagementTick> createState() => _UserManagementTickState();
}

class _UserManagementTickState extends State<UserManagementTick> {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.show = !widget.show;
              });
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20.0), // Customize radius here
                border: Border.all(
                  color: widget.show ? Colors.lightBlue : Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: widget.show
                    ? const Icon(
                        Icons.check,
                        size: 25.0,
                        color: Colors.lightBlue,
                      )
                    : const Icon(
                        Icons.check,
                        size: 25.0,
                        color: Colors.transparent,
                      ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.val,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
