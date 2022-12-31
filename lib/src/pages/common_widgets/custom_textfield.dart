import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initial;
  final bool isReadOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;


  CustomTextField({
    required this.icon,
    required this.labelText,
    this.isSecret = false,
    this.inputFormatters,
    this.initial,
    this.isReadOnly = false,
    this.validator,
    this.controller
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassword = false;

  @override
  void initState() {
    super.initState();

    isPassword = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        obscureText: isPassword,
        initialValue: widget.initial,
        readOnly: widget.isReadOnly,
        decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: isPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
