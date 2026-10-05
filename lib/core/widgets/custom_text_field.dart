import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
