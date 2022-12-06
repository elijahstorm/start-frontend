import 'package:flutter/foundation.dart';
import 'package:start_app_frontend/controllers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_app_frontend/display/components/widgets/avatars.dart';
import 'package:start_app_frontend/display/pages/search/page.dart';
import 'package:start_app_frontend/display/pages/debug/page.dart';
import 'package:start_app_frontend/login/user_state.dart';
import 'package:start_app_frontend/language/constants.dart';

class Header extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function? action;

  const Header(
    this.title, {
    required this.icon,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  final bool _showMenuOptions = false;

  Widget _drawHeaderDropdownButton({
    required String label,
    required IconData icon,
    required VoidCallback? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.defaultPadding * 1.5,
            vertical: Constants.defaultPadding /
                (Responsive.isMobile(context) ? 2 : 1),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(label),
              const SizedBox(width: Constants.defaultPadding),
              Icon(icon),
            ],
          ),
        ),
      );

  Widget _drawMenuOptions() => AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        opacity: _showMenuOptions ? 1 : 0,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: Container(
            padding: const EdgeInsets.only(top: Constants.defaultPadding),
            constraints: _showMenuOptions
                ? const BoxConstraints(maxHeight: double.infinity)
                : const BoxConstraints(maxHeight: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!kReleaseMode)
                        _drawHeaderDropdownButton(
                          label: Language.debugTestingOption,
                          icon: Icons.bug_report,
                          onTap: () => Navigator.pushNamed(
                            context,
                            DebugTestingPage.routeName,
                          ),
                        ),
                      const SizedBox(height: Constants.defaultPadding),
                      Consumer<UserState>(
                        builder: (context, userstate, child) {
                          return GestureDetector(
                            child: child,
                            onTap: () => userstate.logout(),
                          );
                        },
                        child: _drawHeaderDropdownButton(
                          label: Language.logoutButton,
                          icon: Icons.exit_to_app,
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            HeaderAction(
              icon: widget.icon,
              action: widget.action,
            ),
            const SizedBox(width: Constants.defaultPadding),
            CircleOverlappableAvatar(
              size: Constants.defaultPadding * 2,
              display: Container(
                color: Constants.todoColorOptions[3],
                child: Center(
                  child: Image.asset(
                    'assets/imports/avatar-1.png',
                    fit: BoxFit.fill,
                    errorBuilder: (context, _, __) => Image.asset(
                      Constants.placeholderUserIcon,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        _drawMenuOptions(),
      ],
    );
  }
}

class HeaderAction extends StatelessWidget {
  final IconData icon;
  final Function? action;

  const HeaderAction({
    required this.icon,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => action == null
            ? () => Navigator.pushNamed(
                  context,
                  SearchPage.routeName,
                )
            : action!(),
        child: Icon(
          icon,
          color: Theme.of(context).textTheme.bodyText1?.color,
          size: Constants.defaultPadding * 2,
        ),
      );
}
