import 'package:app/adapters/translation.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/boilerplate/text_fields.dart';
import 'package:app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ButtonStyle defaultBtnStyle(BuildContext context, EdgeInsetsGeometry? padding) {
  return TextButton.styleFrom(
    foregroundColor: Theme.of(context).colorScheme.onTertiary,
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    // disabledForegroundColor: Theme.of(context).colorScheme.secondary,
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
    ButtonStyle defaultStyle = btnStyle ??
        TextButton.styleFrom(
          foregroundColor: textColor,
        );

    TextStyle defaultTextStyle = txtStyle ??
        const TextStyle(
          fontFamily: 'Tahoma',
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
  final bool reloadPage;
  final String? pageName;
  const LanguageSelector({super.key, this.reloadPage = false, this.pageName});

  @override
  Widget build(BuildContext context) {
    Color dropDownColor = Theme.of(context).colorScheme.surface;

    return Theme(
        data: Theme.of(context).copyWith(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: DropdownButton<String>(
          dropdownColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.94),
          elevation: 1,
          underline: Container(), // Remove underline
          borderRadius:
              BorderRadius.circular(10.0), // Adiciona bordas arredondadas

          icon: Padding(
            padding: const EdgeInsets.only(right: 55, left: 0),
            child: Icon(Icons.translate, color: Theme.of(context).primaryColor),
          ),

          items: [
            DropdownMenuItem<String>(
              value: 'en',
              child: Text('English', style: TextStyle(color: dropDownColor)),
            ),
            DropdownMenuItem<String>(
              value: 'th',
              child: Text('ไทย', style: TextStyle(color: dropDownColor)),
            ),
            DropdownMenuItem<String>(
              value: 'pt',
              child: Text('Português', style: TextStyle(color: dropDownColor)),
            ),
            DropdownMenuItem<String>(
              value: 'zh-cn',
              child: Text('中文', style: TextStyle(color: dropDownColor)),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              Provider.of<LanguageProvider>(context, listen: false)
                  .changeLanguage(newValue);

              if (reloadPage) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        pageName != null ? localPages(pageName!) : {},
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                  ),
                );
              }
            }
          },
        ));
  }
}
