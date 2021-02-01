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
  final Function(String) validator;
  final AutovalidateMode autovalidateMode;

  const LoginField({
    Key key,
    this.onChange,
    this.controller,
    this.text = "",
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.obscure = false, 
    this.icon, 
    this.validator, 
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
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
      validator: validator,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorStyle: TextStyle(color: Colors.grey),
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
