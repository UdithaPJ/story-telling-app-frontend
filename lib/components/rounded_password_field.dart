import 'package:flutter/material.dart';
import 'package:story/components/textfield_container.dart';
import 'package:story/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.labelText,
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
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "Enter Password",
              icon: Icon(
                Icons.lock,
                color: kPrimaryDarkColor,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: kPrimaryDarkColor,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
