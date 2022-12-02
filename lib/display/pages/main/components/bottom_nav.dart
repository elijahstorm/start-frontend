import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/pages/main/components/navbar_holder.dart';

class HajaSalomonNavbar extends StatefulWidget {
  final ValueNotifier stateIndex;
  final List<NavbarDataHolder> navbarStates;

  const HajaSalomonNavbar({
    required this.navbarStates,
    required this.stateIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<HajaSalomonNavbar> createState() => _HajaSalomonNavbarState();
}

class _HajaSalomonNavbarState extends State<HajaSalomonNavbar> {
  void _updateState(int index) {
    setState(() => widget.stateIndex.value = widget.navbarStates[index].name);
  }

  int get _currentIndex {
    int index = 0;

    for (int i = 0; i < widget.navbarStates.length; i++) {
      if (widget.navbarStates[i].name == widget.stateIndex.value) {
        index = i;
        break;
      }
    }

    return index;
  }

  @override
  Widget build(BuildContext context) {
    var items = <BottomNavigationBarItem>[];

    for (int i = 0; i < widget.navbarStates.length; i++) {
      var nav = widget.navbarStates[i];

      items.add(
        BottomNavigationBarItem(
          icon: Icon(nav.icon),
          label: nav.title,
          // selectedColor: nav.color(context),
        ),
      );
    }

    return SafeArea(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _updateState,
        items: items,
      ),
    );
  }
}
