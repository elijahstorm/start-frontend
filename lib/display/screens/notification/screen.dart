import 'package:flutter/material.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/widgets/responsive_screen.dart';

import 'package:start_app_frontend/content/notifications/cache.dart';
import 'package:start_app_frontend/content/users/cache.dart';
import 'package:start_app_frontend/firebase/auth.dart';

import 'package:start_app_frontend/display/components/teams/user_recommended_friends.dart';
import 'package:start_app_frontend/display/components/notifications/recent_notifications.dart';

class NotificationScreen extends StatelessWidget {
  static const screenName = 'notification';

  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NotificationCache()),
          ChangeNotifierProvider(
            create: (context) => UserCache.nonFriends(AuthApi.activeUser ?? ''),
          ),
        ],
        child: const ResponsiveScreen(
          header: Language.appNavBarTitlesNotos,
          primaryContent: RecentNotifications(),
          sideContent: UserRecommendedFriends(),
        ),
      ),
    );
  }
}
