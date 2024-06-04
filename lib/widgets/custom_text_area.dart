import 'package:flutter/material.dart';

import 'package:portfolio/constants/colors.dart' as constants;

class CustomTextArea extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final bool obsecureText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int minLines;
  final int maxLines;
  final bool isExpaneding;
  final String initValue;

  const CustomTextArea(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.obsecureText = false,
      this.padding,
      this.margin,
      this.validator,
      required this.onSaved,
      this.minLines = 1,
      this.maxLines = 1,
      this.isExpaneding = false,
      this.initValue = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                color: constants.veryLightBeige,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller,
              style: const TextStyle(fontSize: 14),
              cursorColor: constants.darkBeige,
              obscureText: obsecureText,
              minLines: minLines,
              maxLines: maxLines,
              initialValue: initValue,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                contentPadding: const EdgeInsets.only(left: 16),
                border: InputBorder.none,
                errorStyle: const TextStyle(height: 2),
              ),
              validator: validator,
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
