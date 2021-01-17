import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginField extends StatelessWidget {

  final void Function(String) onChange;
  final TextEditingController controller;
  final String text;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final bool obscure;
  final IconData icon;

  const LoginField({
    this.onChange,
    this.controller,
    this.text = "",
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.obscure = false, 
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      inputFormatters: inputFormatters ?? [],
      keyboardType: keyboardType,
      obscureText: obscure,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ) ?? Container(),
        labelText: text ?? "",
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
