import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/login/user_state.dart';
import 'package:start_frontend/language/constants.dart';
import 'package:start_frontend/language/language.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<UserState>(
        builder: (context, user, child) => ElevatedButton(
          onPressed: () => user.logout(),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.red,
            shadowColor: Colors.red,
            elevation: 5,
            minimumSize: const Size.fromHeight(
              Constants.defaultPadding * 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.defaultBorderRadiusXLarge,
              ),
            ),
          ),
          child: const Text(
            Language.logoutButton,
          ),
        ),
      );
}
