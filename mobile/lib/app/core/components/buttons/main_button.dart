import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool inverted;
  final double fontSize;
  final double borderSize;

  const MainButton({
    Key key,
    @required this.text,
    @required this.onTap,
    this.isLoading = false,
    this.width = 150,
    this.height = 45, 
    this.inverted = false, 
    this.fontSize = 16, 
    this.borderSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderSize)),
        color: inverted 
        ? Colors.white 
        : Theme.of(context).primaryColor,
        disabledColor: Colors.grey[300],
        onPressed: isLoading
        ? () {}
        : onTap,
        child: isLoading
        ? Container(
          height: 25,
          width: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                inverted 
                ? Theme.of(context).primaryColor 
                : Colors.white,
              ),
            ),
          ),
        )
        : AutoSizeText(
          text,
          maxLines: 1,
          style: TextStyle(
            color: inverted
            ? Theme.of(context).primaryColor
            : Colors.white, 
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
