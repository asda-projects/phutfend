
import 'package:app/data/adapters/translation.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ButtonStyle defaultBtnStyle(BuildContext context, EdgeInsetsGeometry? padding,{TextStyle? textStyle}) {
  return TextButton.styleFrom(
    textStyle: textStyle,
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
  final Color? iconColor;
  const LanguageSelector({super.key, this.reloadPage = false, this.pageName, this.iconColor});

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
            child: Icon(Icons.translate, color: iconColor ?? Theme.of(context).primaryColor),
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
class DropLanguages extends StatelessWidget {
  final bool reloadPage;
  final String? pageName;
  final Color? iconColor;

  const DropLanguages({
    super.key, 
    this.reloadPage = false, 
    this.pageName, 
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    Color dropDownColor = Theme.of(context).colorScheme.primary;

    return ExpansionTile(
      title: TranslatableText(
        'Languages',
        TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      leading:  Icon(Icons.translate, color: Theme.of(context).colorScheme.primary),
      children: [
        ListTile(
          title: Text('English', style: TextStyle(color: dropDownColor)),
          onTap: () => _changeLanguage(context, 'en'),
        ),
        ListTile(
          title: Text('ไทย', style: TextStyle(color: dropDownColor)),
          onTap: () => _changeLanguage(context, 'th'),
        ),
        ListTile(
          title: Text('Português', style: TextStyle(color: dropDownColor)),
          onTap: () => _changeLanguage(context, 'pt'),
        ),
        ListTile(
          title: Text('中文', style: TextStyle(color: dropDownColor)),
          onTap: () => _changeLanguage(context, 'zh-cn'),
        ),
      ],
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    Provider.of<LanguageProvider>(context, listen: false).changeLanguage(languageCode);

    if (reloadPage) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              pageName != null ? localPages(pageName!) : Container(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
}
class CustomDrawer extends StatelessWidget {
  final List<Widget> tiles;

  const CustomDrawer({
    super.key,
    required this.tiles,

  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.8), // Cor de fundo transparente
      child: ClipRect( // ClipRect é usado para garantir que o efeito de desfoque se limite ao tamanho do Drawer
    child: ListView(
        padding: EdgeInsets.zero,
        children: tiles,
      ),
    ));
  }
}