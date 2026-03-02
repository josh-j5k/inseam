import 'package:inseam/core/notifier/route_notifier.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class NavbarWidget extends StatelessWidget {
  final List<NavigationDestination> destination = [
    NavigationDestination(icon: Icon(FontAwesomeIcons.house), label: "Home"),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.rulerHorizontal),
      label: "Measure",
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.paintbrush),
      label: "Sketch",
    ),
    NavigationDestination(icon: Icon(FontAwesomeIcons.gear), label: "Settings"),
  ];
  NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageIndexNotifier,
      builder: (context, index, child) {
        return NavigationBar(
          destinations: destination,
          selectedIndex: index,
          onDestinationSelected: (int valueChanged) {
            if (index == valueChanged) {
              return;
            }
            selectedPageIndexNotifier.value = valueChanged;
          },
        );
      },
    );
  }
}
