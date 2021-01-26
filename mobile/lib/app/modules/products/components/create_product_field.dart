import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateProductField extends StatelessWidget {

  final void Function(String) onChange;
  final TextEditingController controller;
  final String text;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final bool obscure;
  final IconData icon;
  final Function(String) validator;
  final AutovalidateMode autovalidateMode;
  final int maxLines;

  const CreateProductField({
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
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        inputFormatters: inputFormatters ?? [],
        keyboardType: keyboardType,
        obscureText: obscure,
        cursorColor: Theme.of(context).primaryColor,
        validator: validator,
        autovalidateMode: autovalidateMode,
        maxLines: maxLines,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          errorStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).accentColor,
          ) ?? Container(),
          labelText: text,
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
