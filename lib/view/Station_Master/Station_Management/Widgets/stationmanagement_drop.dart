import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StationManagementDrop extends StatelessWidget {
  String val;
  List<String> items;
  void Function(String?)? onChanged;
  StationManagementDrop(
      {super.key,
      required this.val,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: val,
      items: items.map(
        (String result) {
          return DropdownMenuItem<String>(value: result, child: Text(result));
        },
      ).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
