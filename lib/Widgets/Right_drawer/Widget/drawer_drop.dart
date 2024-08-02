import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerDrop extends StatefulWidget {
  String fieldTitle;
  String? val;
  List<String> items;
  // void Function(String?)? onChanged;

  DrawerDrop({
    super.key,
    required this.fieldTitle,
    required this.val,
    required this.items,
  });

  @override
  State<DrawerDrop> createState() => _DrawerDropState();
}

class _DrawerDropState extends State<DrawerDrop> {
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
            widget.fieldTitle,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        DropdownButtonFormField<String>(
          value: widget.val,
          isExpanded: true,
          items: widget.items
              .map((String result) =>
                  DropdownMenuItem<String>(value: result, child: Text(result)))
              .toList(),
          onChanged: (newValue) => setState(() {
            widget.val = newValue!;
          }),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
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
