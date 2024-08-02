import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerTick extends StatefulWidget {
  String val;
  DrawerTick({super.key, required this.val});

  @override
  State<DrawerTick> createState() => _DrawerTickState();
}

class _DrawerTickState extends State<DrawerTick> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20.0), // Customize radius here
                border: Border.all(
                  color: isChecked
                      ? Colors.lightBlue
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        size: 20.0,
                        color: Colors.lightBlue,
                      )
                    : const Icon(
                        Icons.check,
                        size: 20.0,
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
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
