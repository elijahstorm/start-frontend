import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/play/all_play_column.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/widgets/responsive_screen.dart';

import 'package:start_app_frontend/content/notifications/cache.dart';
import 'package:start_app_frontend/content/users/cache.dart';
import 'package:start_app_frontend/firebase/auth.dart';

class PlayScreen extends StatelessWidget {
  static const screenName = 'dance_play';

  const PlayScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => NotificationCache()),
            ChangeNotifierProvider(
              create: (context) =>
                  UserCache.nonFriends(AuthApi.activeUser ?? ''),
            ),
          ],
          child: const ResponsiveScreen(
            header: Language.appScreenHeaderProfile,
            primaryContent: AllPlayColumn(),
          ),
        ),
      );
}
