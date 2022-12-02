import 'package:flutter/material.dart';

import 'package:start_app_frontend/controllers/ui_manager.dart';
import 'package:start_app_frontend/display/pages/404/page.dart';
import 'package:start_app_frontend/display/pages/debug/page.dart';
import 'package:start_app_frontend/display/pages/settings/page.dart';
import 'package:start_app_frontend/display/pages/permissions/page.dart';
import 'package:start_app_frontend/display/pages/search/page.dart';
import 'package:start_app_frontend/display/pages/billing/page.dart';

class Routes {
  static String initalRoute = UiManager.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    UiManager.routeName: (context) => const UiManager(),
    PermissionsPage.routeName: (context) => const PermissionsPage(),
    BillingPage.routeName: (context) => const BillingPage(),
    SearchPage.routeName: (context) => const SearchPage(),
    AccountSettingsPage.routeName: (context) => const AccountSettingsPage(),
    DebugTestingPage.routeName: (context) => const DebugTestingPage(),
  };

  static Route<dynamic> unknownRoute(RouteSettings settings) =>
      MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => const PageNotFound(),
      );
}
