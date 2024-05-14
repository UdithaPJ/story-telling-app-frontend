import 'package:flutter/material.dart';
import 'package:story/components/textfield_container.dart';
import 'package:story/constants.dart';

class RoundedInputFieldEmail extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldEmail({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0.001), // Adjust padding as needed
          child: Text(
            labelText,
            style: TextStyle(
              color: Color(0XFF818181),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFieldContainer(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: kPrimaryDarkColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
