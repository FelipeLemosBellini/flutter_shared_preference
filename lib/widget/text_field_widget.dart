import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode focusNode;
  final bool autocorrect;
  final int? maxLength;
  final bool autoFocus;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry margin;

  const TextFieldWidget({
    required this.controller,
    required this.focusNode,
    this.margin = EdgeInsets.zero,
    this.labelText,
    this.autocorrect = false,
    this.maxLength,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle get _textStyle {
    return const TextStyle(color: Colors.black);
  }

  TextStyle get _labelStyle {
    return const TextStyle(color: Colors.black45);
  }

  OutlineInputBorder get _focusedBorder {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(16));
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Colors.black, width: 1));
  }

  Color get _cursorColor => Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.margin,
        child: TextField(
            inputFormatters: widget.inputFormatters,
            autocorrect: widget.autocorrect,
            cursorColor: _cursorColor,
            focusNode: widget.focusNode,
            style: _textStyle,
            maxLength: widget.maxLength,
            autofocus: widget.autoFocus,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                border: _border,
                focusedBorder: _focusedBorder,
                constraints: const BoxConstraints(maxHeight: 36),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: _labelStyle,
                labelText: widget.labelText)));
  }
}
