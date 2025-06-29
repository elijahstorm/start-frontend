import 'package:flutter/material.dart';

import 'package:start_frontend/display/pages/main/components/navbar_holder.dart';

class StartAppNavbar extends StatefulWidget {
  final ValueNotifier stateIndex;
  final List<NavbarDataHolder> navbarStates;

  const StartAppNavbar({
    required this.navbarStates,
    required this.stateIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<StartAppNavbar> createState() => _StartAppNavbarState();
}

class _StartAppNavbarState extends State<StartAppNavbar> {
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
        ),
      );
    }

    return
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     const Divider(),
        //     Container(
        //       margin: const EdgeInsets.symmetric(
        //         horizontal: Constants.defaultPadding,
        //       ),
        //       child:
        BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _updateState,
      items: items,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).textTheme.headlineMedium?.color,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showUnselectedLabels: true,
      //       elevation: 0,
      //     ),
      //   ),
      // ],
    );
  }
}
