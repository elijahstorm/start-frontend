import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/calendar/focused_date.dart';
import 'package:start_app_frontend/display/components/calendar/calendar.dart';
import 'package:start_app_frontend/display/components/calendar/todo.dart';
import 'package:start_app_frontend/display/components/widgets/responsive_content.dart';
import 'package:start_app_frontend/content/todo/cache.dart';

class TeamCalendar extends StatelessWidget {
  final String team;

  const TeamCalendar({
    required this.team,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FocusedDate(),
          ),
          ChangeNotifierProvider(
            create: (context) => TodoCache.team(team),
          ),
        ],
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const ResponsiveContent.landscapeFriendly(
            primaryContent: Calendar(),
            secondaryContent: Todo(),
          ),
        ),
      );
}
