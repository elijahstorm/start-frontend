import 'package:flutter/material.dart';
import 'package:start_frontend/content/teams/content.dart';
import 'package:start_frontend/display/screens/play/screen.dart';
import 'package:start_frontend/language/constants.dart';
import 'package:start_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/controllers/menu_controller.dart';
import 'package:start_frontend/controllers/responsive.dart';
import 'package:start_frontend/display/pages/main/components/bottom_nav.dart';
import 'package:start_frontend/display/pages/main/components/side_menu.dart';
import 'package:start_frontend/display/pages/main/components/navbar_holder.dart';

import 'package:start_frontend/display/screens/calendar/screen.dart';
import 'package:start_frontend/display/screens/stats/screen.dart';
import 'package:start_frontend/display/screens/teams/screen.dart';
import 'package:start_frontend/display/screens/classes/screen.dart';
import 'package:start_frontend/display/screens/profile/screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<MainScreen> {
  ValueNotifier<String> _stateIndexNotifier = ValueNotifier('unset');

  final int _defaultScreen = 0;
  final List<NavbarDataHolder> _navbarStates = [
    NavbarDataHolder(
      name: ClassesScreen.screenName,
      child: const ClassesScreen(),
      icon: Icons.home_rounded,
      title: Language.appNavBarTitlesClasses,
      color: (context) => Colors.pink,
    ),
    NavbarDataHolder(
      name: CalendarScreen.screenName,
      child: const PlayScreen(),
      icon: Icons.games_outlined,
      title: Language.appNavBarTitlesCalendar,
      color: (context) => Theme.of(context).colorScheme.secondary,
    ),
    NavbarDataHolder(
      name: StatsScreen.screenName,
      child: const ClassesScreen(),
      icon: Icons.menu,
      title: Language.appNavBarTitlesHome,
      color: (context) => Colors.amber,
    ),
    NavbarDataHolder(
      name: MeetupScreen.screenName,
      child: const MeetupScreen(),
      fab: (BuildContext context) => FloatingActionButton(
        onPressed: () => TeamContent.makeNewTeam(context),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.edit,
          size: Constants.defaultPadding * 2,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      icon: Icons.pin_drop_outlined,
      title: Language.appNavBarTitlesTeams,
      color: (context) => Theme.of(context).primaryColor,
    ),
    NavbarDataHolder(
      name: ProfileScreen.screenName,
      child: const ProfileScreen(),
      icon: Icons.person_outline,
      title: Language.appNavBarTitlesProfile,
      color: (context) => Colors.teal,
    ),
  ];

  @override
  void initState() {
    super.initState();
    if (_stateIndexNotifier.value == 'unset') {
      _stateIndexNotifier =
          // ValueNotifier(_navbarStates[_defaultScreen + 2].name);
          ValueNotifier(_navbarStates[_defaultScreen].name);
    }
  }

  Widget _decideInteriorBody() {
    for (int i = 0; i < _navbarStates.length; i++) {
      if (_navbarStates[i].name == _stateIndexNotifier.value) {
        return _navbarStates[i].child;
      }
    }

    return _navbarStates[_defaultScreen].child;
  }

  Widget _decideFloatingActionButton() {
    for (int i = 0; i < _navbarStates.length; i++) {
      if (_navbarStates[i].name == _stateIndexNotifier.value) {
        if (_navbarStates[i].fab == null) return Container();
        return SizedBox(
          width: Constants.defaultPadding * 3,
          child: FittedBox(
            child: _navbarStates[i].fab!(context),
          ),
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: context.read<StartMenuController>().scaffoldKey,
        bottomNavigationBar: Responsive.isDesktop(context)
            ? null
            : StartAppNavbar(
                stateIndex: _stateIndexNotifier,
                navbarStates: _navbarStates,
              ),
        floatingActionButton: ValueListenableBuilder<String>(
          valueListenable: _stateIndexNotifier,
          builder: (context, value, child) => _decideFloatingActionButton(),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(
                  stateIndex: _stateIndexNotifier,
                  navbarStates: _navbarStates,
                ),
              ),
            Expanded(
              flex: 5,
              child: ValueListenableBuilder<String>(
                valueListenable: _stateIndexNotifier,
                builder: (context, value, child) => _decideInteriorBody(),
              ),
            ),
          ],
        ),
      );
}
