import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatefulWidget {
  final String hinttext;
  final bool obscuretext;
  final IconData image;
  final TextStyle hintstyle;
  final IconData? iconimage;
  final VoidCallback? onshowhide;
  final TextEditingController? controller;
  Color color;
  Color? suffixiconcolor;
  Color iconcolor;
  InputBorder outlinedBorder;
  OutlineInputBorder? outLineInputBorder;

  final String? Function(dynamic)? validator;
  Function? onchange;

  TextFormFieldWidget(
      {super.key,
      required this.hinttext,
      required this.obscuretext,
      required this.image,
      required this.hintstyle,
      this.onshowhide,
      this.controller,
      this.validator,
      this.onchange,
      this.suffixiconcolor,
      required this.color,
      required this.iconcolor,
      required this.outlinedBorder,
      this.outLineInputBorder,
      this.iconimage});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onChanged: (value) {
        if (widget.onchange != null) {
          widget.onchange!(value);
        }
      },
    
      controller: widget.controller,
      obscureText: widget.obscuretext,
      decoration: InputDecoration(
          enabledBorder:widget.outLineInputBorder ,
        
          filled: true,
          fillColor: widget.color,
          hintText: widget.hinttext,
          prefixIcon: Icon(
            widget.image,
            size: 28,
            color: widget.iconcolor,
          ),
          suffixIcon: IconButton(
              onPressed: widget.onshowhide,
              icon: Icon(
                widget.iconimage,
                color: widget.suffixiconcolor,
              )),
          hintStyle: widget.hintstyle,
          border: widget.outlinedBorder
          )
    );
  }
}