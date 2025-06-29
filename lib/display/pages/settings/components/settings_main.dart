import 'package:flutter/material.dart';

import 'package:start_frontend/display/components/widgets/skeleton.dart';
import 'package:start_frontend/display/components/widgets/dividers.dart';
import 'package:start_frontend/display/components/widgets/editable.dart';
import 'package:start_frontend/language/settings_keys.dart';
import 'package:start_frontend/language/constants.dart';
import 'package:start_frontend/language/language.dart';
import 'package:start_frontend/language/theme.dart';

class DashSettingsMain extends StatelessWidget {
  const DashSettingsMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Main Settings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: Constants.defaultPadding),
        Container(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Column(
            children: [
              CustomEditable(
                label: Language.settingsVisualBrightness,
                content: ThemeSwitcher(),
              ),
              CustomDivider(),
              CustomEditable(
                label: Language.settingsNotosAlarm,
                content: StoredPreferenceSwitcher(
                  keyName: SettingsKeyValues.settingsNotosAlarm,
                ),
              ),
              CustomEditable(
                label: Language.settingsCalendarEventType,
                content: StoredPreferenceSwitcher(
                  keyName: SettingsKeyValues.settingsCalendarEventType,
                ),
              ),
              CustomDivider(),
              SkeletonLoader(
                amount: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
