
import 'package:app/data/adapters/firebase/auth.dart';
import 'package:app/data/adapters/translation.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropPopupMenu extends StatefulWidget {
  final IconData? floatingBtnIcon;

  final List<PopupMenuEntry<String>> childrensOverlayEntry;

  const DropPopupMenu({
    super.key,
    required this.childrensOverlayEntry,
    required this.floatingBtnIcon,
  });

  @override
  _DropPopupMenuState createState() => _DropPopupMenuState();
}

class _DropPopupMenuState extends State<DropPopupMenu> {
void _showOptions(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: widget.childrensOverlayEntry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      shape: const CircleBorder(eccentricity: 0.3),
      onPressed: () {
        _showOptions(context);
      },
      child: Icon(widget.floatingBtnIcon),
    );
  }
}


class DropModalBottomSheet extends StatefulWidget {
  final IconData? floatingBtnIcon;
  final List<Widget> childrensOverlayEntry;
  

  const DropModalBottomSheet({
    super.key,
    required this.childrensOverlayEntry, required this.floatingBtnIcon,
    
  });

  @override
  // ignore: library_private_types_in_public_api
  _DropModalBottomSheetState createState() =>
      _DropModalBottomSheetState();
}

class _DropModalBottomSheetState extends State<DropModalBottomSheet> {



void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: widget.childrensOverlayEntry
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      shape: const CircleBorder(eccentricity: 0.3),
        onPressed: () {
          _showOptions(context);
        },
        child: Icon(widget.floatingBtnIcon),
      );
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


class DropButton extends StatefulWidget {


  const DropButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  
  AuthUser authUser = AuthUser();
  Map cachedTranslation = {};
  String translatedText = 'Logout';
  



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getTranslation();
    Provider.of<LanguageProvider>(context, listen: false).addListener(_getTranslation);
  }

  @override
  void dispose() {
    super.dispose();
    
    // Remove listener when disposing
    Provider.of<LanguageProvider>(context, listen: false).removeListener(_getTranslation);
  }

  Future<void> _getTranslation() async {
    String translation = await getCachedTranslation(context, "Logout", cachedTranslation);
    if(mounted) {setState(() {
      translatedText = translation;
    });}
  }

  @override
  Widget build(BuildContext context) {

    

    return DropdownButton<String>(
          dropdownColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.94),
          elevation: 1,
          underline: Container(), // Remove underline
          borderRadius:
              BorderRadius.circular(10.0), // Adiciona bordas arredondadas

          icon: const Padding(
            padding:  EdgeInsets.only(right: 20, left: 0),
            child:  Icon(Icons.person_2_sharp)),
          

          items: [
            
              
            DropdownMenuItem<String>(
              value: 'logout',
              child: Text(translatedText, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor)),
            ),
          ], 
          onChanged: (String? value) async {
            
            if (value == "logout") {
              if (mounted) navigateToPage(context, "Home");
              await authUser.logout();
              
              }

          },
          
          );
  }
}