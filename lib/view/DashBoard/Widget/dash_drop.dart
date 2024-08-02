import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashBoardDrop extends StatefulWidget {
  String val;
  List<String> items;
  DashBoardDrop({super.key, required this.val, required this.items});

  @override
  State<DashBoardDrop> createState() => _DashBoardDropState();
}

class _DashBoardDropState extends State<DashBoardDrop> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        value: widget.val,
        items: widget.items
            .map(
              (String result) => DropdownMenuItem<String>(
                value: result,
                child: Text(result),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          setState(
            () {
              widget.val = newValue!;
            },
          );
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.lightBlue),
            )),
      ),
    );
  }
}
