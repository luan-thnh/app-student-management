import 'package:flutter/material.dart';
import 'package:student_management/constants/colors_theme.dart';

class InputControlWidget extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const InputControlWidget({super.key, required this.label, required this.hintText, required this.controller, this.onTap, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            label,
            style: TextStyle(color: ColorsTheme.white, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 42,
          child: TextFormField(
            controller: controller,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: ColorsTheme.gray, fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: validator,
          ),
        )
      ],
    );
  }
}
