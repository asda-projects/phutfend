import 'package:flutter/material.dart';

class OverflowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  final double additionalWidth;
  final double incrementWidth;
  final double titleWidth;
  final double singleElementThreshold;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const OverflowAppBar({
    super.key,
    required this.actions,

    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.leading,
    this.title,
    this.bottom, 
    this.singleElementThreshold = 55,
    this.titleWidth = 200,
    this.additionalWidth = 48, 
    this.incrementWidth = 100, 
    this.mainAxisAlignment = MainAxisAlignment.start, 
    this.mainAxisSize = MainAxisSize.max
    
  });

  double calculateRequiredWidth({
    required BuildContext context,
    required BoxConstraints constraints,
    required bool automaticallyImplyLeading,
    Widget? leading,
    Widget? title,
    double leadingWidth = kToolbarHeight,

  }) {
    double requiredWidth = 0;

    // Calculate the width needed for the leading widget or the back button
    if (automaticallyImplyLeading && Navigator.canPop(context)) {
      requiredWidth += leadingWidth; // Default width of the back button
    } else if (leading != null) {
      requiredWidth += leadingWidth; // Width of the custom leading widget
    }

    // Estimate the width for the title
    if (title != null) {
      requiredWidth += titleWidth; // Assuming the title will take up to 200 pixels. Adjust as needed.
    }

    return requiredWidth;
  }

  List<T> getGenericElements<T>({
    required List<T> elements,
    required double initialRequiredWidth,
    required double availableWidth,
    required double additionalWidth,
    required double incrementWidth,

  }) {
    List<T> visibleElements = [];
    double requiredWidth = initialRequiredWidth;

    for (var element in elements) {
      if (requiredWidth + additionalWidth <= availableWidth) {
        visibleElements.add(element);
        requiredWidth += incrementWidth;
      } else {
        break;
      }
    }

    if (visibleElements.length == 1 && requiredWidth + singleElementThreshold >= availableWidth) {
      visibleElements.clear();
    }

    return visibleElements;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double requiredWidth = calculateRequiredWidth(
          context: context,
          constraints: constraints,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          title: title,
        );

        double availableWidth = constraints.maxWidth;

        List<Widget> visibleActions = getGenericElements<Widget>(
          elements: actions,
          initialRequiredWidth: requiredWidth,
          availableWidth: availableWidth,
          additionalWidth: additionalWidth,
          incrementWidth: incrementWidth,
          
        );

        return AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          leading: leading,
          title: title,
          actions: [
            Expanded(
            child: Row(
            mainAxisSize:mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            children: visibleActions
            ))],
          bottom: bottom,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
