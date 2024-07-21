import 'package:flutter/material.dart';

class ResponsiveContent extends StatelessWidget {
  final dynamic body;

  const ResponsiveContent({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;

        return SingleChildScrollView(
          
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: maxHeight,
              minWidth: maxWidth,
            ),
            child: IntrinsicHeight(

              child: body,
            ),
          ),
        );
      },
    );
  }
}