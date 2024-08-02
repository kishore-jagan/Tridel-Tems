import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StationManagementText extends StatefulWidget {
  // String val;
  const StationManagementText({
    super.key,
  });

  @override
  State<StationManagementText> createState() => _StationManagementTextState();
}

class _StationManagementTextState extends State<StationManagementText> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        // hintText: widget.val,

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
    );
  }
}
