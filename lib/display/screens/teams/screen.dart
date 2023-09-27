import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/display/components/widgets/responsive_screen.dart';
import 'package:start_frontend/content/teams/cache.dart';
import 'package:start_frontend/display/components/meetup/meetup_column.dart';
import 'package:start_frontend/language/language.dart';

class MeetupScreen extends StatelessWidget {
  static const screenName = 'meetup';

  const MeetupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TeamsCache.activeUserTeams(),
          ),
        ],
        child: const ResponsiveScreen(
          header: Language.appNavBarTitlesTeams,
          primaryContent: MeetupColumn(),
        ),
      ),
    );
  }
}
