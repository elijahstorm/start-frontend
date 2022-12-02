import 'package:flutter/material.dart';
import 'package:start_app_frontend/firebase/core.dart';
import 'package:start_app_frontend/language/settings_keys.dart';
import 'package:start_app_frontend/login/intro_screen.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/controllers/menu_controller.dart';
import 'package:start_app_frontend/display/pages/main/page.dart';
import 'package:start_app_frontend/display/components/animations/loading.dart';
import 'package:start_app_frontend/display/components/widgets/error.dart';
import 'package:start_app_frontend/login/user_state.dart';
import 'package:start_app_frontend/login/login_screen.dart';

class UiManager extends StatefulWidget {
  static const routeName = '/main';

  const UiManager({
    Key? key,
  }) : super(key: key);

  @override
  State<UiManager> createState() => _UiManagerState();
}

class _UiManagerState extends State<UiManager> {
  Widget mainScreen(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
          ChangeNotifierProvider(create: (context) => UserState()),
        ],
        child: Consumer<UserState>(
          builder: (context, userstate, child) {
            return userstate.data.exists
                ? const MainScreen()
                : SettingsKeyValues.buildWhenReady(
                    key: SettingsKeyValues.appIntroHasBeenSeen,
                    isBool: true,
                    defaultValue: false,
                    builder: (seen) => seen
                        ? const LoginScreen()
                        : IntroScreen(
                            onFinished: () async {
                              await SettingsKeyValues.set(
                                key: SettingsKeyValues.appIntroHasBeenSeen,
                                isBool: true,
                                value: true,
                              );
                              (context as Element).markNeedsBuild();
                            },
                          ),
                  );
          },
        ),
      );

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: FirebaseApi.init(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: ErrorDisplay(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return mainScreen(context);
          }

          return const Loading();
        },
      );
}
