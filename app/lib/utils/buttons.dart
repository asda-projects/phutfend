import 'package:flutter/material.dart';



ButtonStyle defaultBtnStyle(BuildContext context, EdgeInsetsGeometry? padding) {return TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor:  Colors.black,
  disabledForegroundColor: Colors.grey.withOpacity(0.38),
  padding: padding,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

}






class CustomIconAndTextButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final String text;
  final EdgeInsets padding;
  final bool addIcon;
  final dynamic btnStyle;
  final dynamic txtStyle;
  final bool switchToColumn;
  final double iconSize;
  final Color iconColor;
  final Color textColor;

  const CustomIconAndTextButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.text,
      required this.padding,
      this.addIcon = true,
      this.btnStyle,
      this.txtStyle,
      this.switchToColumn = false,
      this.iconSize = 20,
      this.iconColor = Colors.white,
      this.textColor = Colors.white

      
      });

  @override
  Widget build(BuildContext context) {

    ButtonStyle defaultStyle = btnStyle ?? TextButton.styleFrom( 
      foregroundColor: textColor,
    );

    TextStyle defaultTextStyle = txtStyle ?? const TextStyle(
      fontSize: 16,
    );

    

    List<Widget> widgets = [];

    if (addIcon) {
      widgets.add(Icon(icon, size: iconSize, color: iconColor));
    }

    widgets.add(Padding(
      padding: padding,
      child: Text(text, style: defaultTextStyle),
    ));

    

    return TextButton(
      style: defaultStyle,
      onPressed: onPressed,
      child:  switchToColumn ? Column( children: widgets) : Row(children: widgets),
      
    );
    
  }
}

