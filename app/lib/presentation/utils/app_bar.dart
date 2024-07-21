import 'package:flutter/material.dart';

class OverflowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;

  const OverflowAppBar({
    super.key,
    required this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double requiredWidth = 0;

        // Calcular a largura necessária para o leading widget ou o botão de back
        if (automaticallyImplyLeading && Navigator.canPop(context)) {
          requiredWidth += kToolbarHeight; // Largura padrão do botão de back
        } else if (leading != null) {
          requiredWidth += kToolbarHeight; // Largura do widget leading customizado
        }

        // Estimar a largura para o título
        if (title != null) {
          requiredWidth += 200; // Assumindo que o título ocupará até 200 pixels. Ajuste conforme necessário.
        }

        // Manter sua lógica para a largura das ações
        List<Widget> visibleActions = [];
        for (var action in actions) {
          if (requiredWidth + 48 <= availableWidth) {
            visibleActions.add(action);
            requiredWidth += 100;
          } else {
            break;
          }
        }

        if (visibleActions.length == 1 && requiredWidth + 55 >= availableWidth) {
          visibleActions.clear();
        }

        return AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          leading: leading,
          title: title,
          actions: visibleActions,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
