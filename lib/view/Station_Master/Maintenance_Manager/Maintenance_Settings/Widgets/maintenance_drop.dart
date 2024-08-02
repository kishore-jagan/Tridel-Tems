import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MaintenanceSettingsDrop extends StatelessWidget {
  String fieldTitle;
  String val;
  List<String> items;
  void Function(String?)? onChanged;

  MaintenanceSettingsDrop(
      {super.key,
      required this.fieldTitle,
      required this.val,
      required this.items,
      required this.onChanged});

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
            fieldTitle,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        DropdownButtonFormField<String>(
          value: val,
          isExpanded: true,
          items: items
              .map((String result) =>
                  DropdownMenuItem<String>(value: result, child: Text(result)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: '--Choose Role--',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
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
