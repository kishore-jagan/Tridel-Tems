import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class MaintenanceSettingsDateTime extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController dateTextController;
  final Callback onPressed;
  const MaintenanceSettingsDateTime(
      {super.key,
      required this.fieldTitle,
      required this.onPressed,
      required this.dateTextController});

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
        TextField(
          controller: dateTextController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: 'dd-mm-yyyy',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
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
            suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today), onPressed: onPressed),
          ),
          readOnly: true,
        ),
      ],
    );
  }
}
