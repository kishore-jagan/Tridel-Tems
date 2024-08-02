import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DrawerText extends StatelessWidget {
  final String fieldText;
  final TextEditingController textController;
  final Callback onTap;

  const DrawerText(
      {super.key,
      required this.fieldText,
      required this.textController,
      required this.onTap});

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
          controller: textController,
          onTap: onTap,
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.calendar_today,
              size: 20,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.2),
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
