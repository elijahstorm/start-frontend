import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/profile/profile_column.dart';
import 'package:start_app_frontend/display/components/profile/temp_profile_content.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/widgets/responsive_screen.dart';

import 'package:start_app_frontend/content/dashboard/cache.dart';
import 'package:start_app_frontend/content/users/cache.dart';
import 'package:start_app_frontend/content/teams/cache.dart';
import 'package:start_app_frontend/firebase/auth.dart';

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
          icon: Icons.settings,
          primaryContent: ProfileColumn(
            profile: ProfileContent(
              image: 'assets/imports/avatar-1.png',
              name: 'eli',
              userHandle: '@iamthebest',
              email: 'anna1234@gmail.com',
              location: 'Bangkok, Thailand',
              posts: 50,
              followers: 402,
              following: 224,
              messages: 2,
              private: false,
              premium: false,
            ),
          ),
        ),
      ),
    );
  }
}
