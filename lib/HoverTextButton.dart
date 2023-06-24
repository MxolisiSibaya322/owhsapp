import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  final String text;
  final TextStyle defaultStyle;
  final TextStyle hoverStyle;
  final VoidCallback onPressed;

  const HoverTextButton({super.key, 
    required this.text,
    required this.defaultStyle,
    required this.hoverStyle,
    required this.onPressed,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoverTextButtonState createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: Text(
        widget.text,
        style: _isHovered ? widget.hoverStyle : widget.defaultStyle,
      ),
    );
  }
}
