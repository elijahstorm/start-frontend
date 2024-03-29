import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/display/components/teams/user_profile_view.dart';
import 'package:start_frontend/display/components/widgets/error.dart';
import 'package:start_frontend/firebase/auth.dart';
import 'package:start_frontend/login/user_state.dart';
import 'package:start_frontend/language/language.dart';

class DashboardProfileDisplay extends StatelessWidget {
  const DashboardProfileDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AuthApi.activeUser == null) {
      return Consumer<UserState>(
        builder: (context, userstate, child) {
          return ErrorDisplay(
            Language.reloginRequest,
            retryPrompt: Language.reloginButton,
            retry: () {
              userstate.logout();
            },
          );
        },
      );
    }

    return UserProfileView(
      AuthApi.activeUser!,
      noBackground: true,
    );
  }
}
