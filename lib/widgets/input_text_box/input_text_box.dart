import 'package:flutter/material.dart';
import 'validate_input.dart';

typedef OnChangeInput = Function(String value);

class InputTextBox extends StatefulWidget {
  const InputTextBox({
    super.key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.isPassword = false,
    this.isNumber = false,
    this.isReadOnly = false,
    this.isTextArea = false,
    this.icon,
    this.onChange,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final IconData? icon;
  final bool isNumber;
  final bool isReadOnly;
  final bool isTextArea;
  final OnChangeInput? onChange;

  @override
  State<InputTextBox> createState() => _InputTextBoxState();
}

class _InputTextBoxState extends State<InputTextBox> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return !widget.isPassword
        ? TextFormField(
            controller: widget.controller,
            keyboardType: widget.isNumber
                ? TextInputType.number
                : widget.isTextArea
                    ? TextInputType.multiline
                    : TextInputType.text,
            decoration: InputDecoration(
              icon: widget.icon != null ? Icon(widget.icon) : const SizedBox(),
              labelText: widget.label,
              hintText: widget.hint,
            ),
            validator: (value) => validateInput(value, widget.label),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: widget.isReadOnly,
            maxLines: widget.isTextArea ? null : 1,
            onChanged: widget.onChange,
          )
        : Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: widget.hint,
                  icon: widget.icon != null
                      ? Icon(widget.icon)
                      : const SizedBox(),
                ),
                obscureText: isHidePassword,
                validator: (value) => validateInput(value, widget.label),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              IconButton(
                icon: Icon(
                  isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFC6CBD4),
                ),
                onPressed: () {
                  setState(
                    () {
                      isHidePassword = !isHidePassword;
                    },
                  );
                },
              )
            ],
          );
  }
}
