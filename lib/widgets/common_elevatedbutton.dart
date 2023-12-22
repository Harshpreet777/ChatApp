import 'package:chatapp/utils/color_constant.dart';

import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onpress;

  const ElevatedButtonWidget({super.key, required this.text, this.onpress});

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onpress,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(ColorConstant.red),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: Text(
        widget.text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorConstant.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
