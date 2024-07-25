
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

class DropDownFloatingActionButton extends StatefulWidget {
  final IconData? floatingBtnIcon;
  final List<Widget> childrensOverlayEntry;

  const DropDownFloatingActionButton({
    super.key,
    required this.floatingBtnIcon,
    required this.childrensOverlayEntry,
  });

  @override
  _DropDownFloatingActionButtonState createState() =>
      _DropDownFloatingActionButtonState();
}

class _DropDownFloatingActionButtonState
    extends State<DropDownFloatingActionButton> with WidgetsBindingObserver {
  OverlayEntry? _overlayEntry;
  final Map<String, String> _translations = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cacheTranslations();
    Provider.of<LanguageProvider>(context, listen: false).addListener(_cacheTranslations);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Remove listener when disposing
    Provider.of<LanguageProvider>(context, listen: false).removeListener(_cacheTranslations);
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _removeOverlay();
    }
  }

void _cacheTranslations() async {
  for (var child in widget.childrensOverlayEntry) {
    if (child is ListTile && child.title is TranslatableText) {
      TranslatableText translatableText = child.title as TranslatableText;
      String translation = await getCachedTranslation(context, translatableText.text, _translations);
      setState(() {
        _translations[translatableText.text] = translation;
      });
    }
  }
}


  double adjustHeightOverlay(double screenSizeHeight ) {
    
    
    if (screenSizeHeight >= 830) {
      
      return  screenSizeHeight * 0.12;
    }

    return screenSizeHeight * 0.17;

  }

  OverlayEntry _createOverlayEntry() {
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  var size = renderBox.size;
  var offset = renderBox.localToGlobal(Offset.zero);
  var screenSize = MediaQuery.of(context).size;


  

  return OverlayEntry(

    builder: (context) => GestureDetector(
      behavior:  HitTestBehavior.translucent,
      onTap: _removeOverlay, // Close overlay when tapping outside
      // behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Positioned(
            left: offset.dx - 65,
            top: offset.dy - size.height - adjustHeightOverlay(screenSize.height),
            width: size.width + 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Material(
                
                color: Colors.black, // Make the material transparent
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.childrensOverlayEntry.map((child) {
                    if (child is ListTile && child.title is TranslatableText) {
                      TranslatableText translatableText =
                          child.title as TranslatableText;
                      return ListTile(
                        title: Text(_translations[translatableText.text] ??
                            translatableText.text),
                        onTap: () {
                          if (child.onTap != null) {
                            child.onTap!();
                          }
                          _removeOverlay();
                        },
                      );
                    } else {
                      return child;
                    }
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void didChangeMetrics() {
    _removeOverlay();
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      shape: const CircleBorder(eccentricity: 0.3),
      onPressed: _toggleDropdown,
      child: Icon(widget.floatingBtnIcon),
    );
  }
}