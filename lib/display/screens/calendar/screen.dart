import 'package:flutter/material.dart';
import 'package:start_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/display/components/widgets/responsive_screen.dart';

import 'package:start_frontend/display/components/calendar/calendar.dart';
import 'package:start_frontend/display/components/calendar/focused_date.dart';
import 'package:start_frontend/display/components/calendar/todo.dart';
import 'package:start_frontend/display/components/teams/team_avatars.dart';

import 'package:start_frontend/content/notifications/cache.dart';
import 'package:start_frontend/display/components/notifications/friends_recent.dart';

import 'package:start_frontend/content/todo/cache.dart';
import 'package:start_frontend/content/teams/cache.dart';

class CalendarScreen extends StatelessWidget {
  static const screenName = 'calendar';

  const CalendarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FocusedDate(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoCache.oldest(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamsCache.activeUserTeams(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationCache.friends(),
        ),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const ResponsiveScreen.landscapeFriendly(
          header: '${Language.appName}: ${Language.appSubtitle}',
          primaryContent: Calendar(),
          mobileHeaderContent: TeamMemberSmallCircleRow(),
          secondaryContent: Todo(),
          sideContent: RecentFriendActivities(),
        ),
      ),
    );
  }
}
