import 'package:app/services/translation.dart';
import 'package:app/utils/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



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
  final String? text;
  final EdgeInsets padding;
  final bool addIcon;
  final bool addText;
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
      this.text,
      required this.padding,
      this.addIcon = true,
      this.addText = true,
      this.btnStyle,
      this.txtStyle,
      this.switchToColumn = false,
      this.iconSize = 20,
      this.iconColor = Colors.white,
      this.textColor = Colors.white});

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

    if (addText && text != null) {
      widgets.add(Padding(
        padding: padding,
        child: TranslatableText(text!, defaultTextStyle),
      ));
    }

    return TextButton(
      style: defaultStyle,
      onPressed: onPressed,
      child: switchToColumn
          ? Column(children: widgets)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
    );
  }
}




class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Colors.transparent,
        focusColor:  Colors.transparent,

      ),
      child: DropdownButton<String>(
          dropdownColor: Color.fromRGBO(0, 0, 0, 0.886),
           
          underline: Container(), // Remove underline
          borderRadius: BorderRadius.circular(10.0), // Adiciona bordas arredondadas
          
          icon: const Padding(
            padding: EdgeInsets.only(right: 55, left: 0),
            child: Icon(Icons.translate, color: Colors.black),
          ),
          
          items: const [
             DropdownMenuItem<String>(
              value: 'en',
              child: Text('English', style:  TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'th',
              child: Text('ไทย', style:  TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'pt',
              child: Text('Português', style:  TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'zh-cn',
              child: Text('中文', style:  TextStyle(color: Colors.white54)),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              Provider.of<LanguageProvider>(context, listen: false).changeLanguage(newValue);
            }
          },
        
      
    ));
  }
}




