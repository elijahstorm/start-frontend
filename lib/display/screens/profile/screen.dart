import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/teams/logout_button.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/widgets/responsive_screen.dart';

import 'package:start_app_frontend/content/dashboard/cache.dart';
import 'package:start_app_frontend/content/users/cache.dart';
import 'package:start_app_frontend/content/teams/cache.dart';
import 'package:start_app_frontend/firebase/auth.dart';

import 'package:start_app_frontend/display/components/teams/user_profile_dash.dart';
import 'package:start_app_frontend/display/components/teams/our_team_members.dart';

class ProfileScreen extends StatelessWidget {
  static const screenName = 'profile';

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DashboardCache(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserCache.team(AuthApi.activeUser ?? ''),
          ),
          ChangeNotifierProvider(
            create: (context) => TeamsCache.activeUserTeams(),
          ),
        ],
        child: const ResponsiveScreen(
          header: Language.appNavBarTitlesProfile,
          primaryContent: DashboardProfileDisplay(),
          sideContent: OurTeamMembers(),
          secondaryContent: LogoutButton(),
        ),
      ),
    );
  }
}
