import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/widgets/alerts.dart';

import 'package:start_app_frontend/firebase/firestore.dart';
import 'package:start_app_frontend/firebase/storage.dart';
import 'package:start_app_frontend/language/theme.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:start_app_frontend/language/constants.dart';
import 'package:start_app_frontend/language/settings_keys.dart';
import 'package:start_app_frontend/controllers/keys.dart';
import 'package:start_app_frontend/display/components/animations/loading.dart';
import 'package:start_app_frontend/display/components/widgets/editable.dart';
import 'package:start_app_frontend/display/components/teams/vertical_user_list.dart';

import 'package:start_app_frontend/content/users/content.dart';

class UserEditorDisplay extends StatelessWidget {
  final UserContent user;

  const UserEditorDisplay(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CloseAndSaveEditor(
      content: user,
      title: Language.userEditorTitle,
      child: Padding(
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Constants.defaultPadding),
              CustomEditableWidget<StorageFile>(
                onSave: (file) async {
                  if (file == null) return;

                  var url = await StorageApi.set(
                    isTeam: true,
                    id: user.id,
                  ).upload.images.file(
                    file,
                    onError: (error) {
                      if (GlobalKeys.rootScaffoldMessengerKey.currentState ==
                          null) return;
                      GlobalKeys.rootScaffoldMessengerKey.currentState!
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            '${user.title} upload failed. $error',
                          ),
                          duration: kReleaseMode
                              ? const Duration(seconds: 4)
                              : const Duration(seconds: 20),
                        ),
                      );
                    },
                  );

                  if (url == null) return;

                  user.picture = url.replaceAll(
                    Constants.storageUrlPrefix,
                    '',
                  );

                  FirestoreApi.feel(
                    type: UserContent.collectionName,
                    id: user.id,
                    field: 'picture',
                    value: user.picture,
                  );

                  if (GlobalKeys.rootScaffoldMessengerKey.currentState ==
                      null) {
                    return;
                  }
                  GlobalKeys.rootScaffoldMessengerKey.currentState!
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Picture finished uploading. Refresh the page to see the changes.'),
                    ),
                  );
                },
                onTap: () async => await StorageApi.file.gallery(
                  onError: (error) {
                    if (GlobalKeys.rootScaffoldMessengerKey.currentState ==
                        null) return;
                    GlobalKeys.rootScaffoldMessengerKey.currentState!
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          '${user.title} upload failed. $error',
                        ),
                        duration: kReleaseMode
                            ? const Duration(seconds: 4)
                            : const Duration(seconds: 20),
                      ),
                    );
                  },
                ),
                container: (child) => ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Constants.defaultBorderRadiusXLarge,
                    ),
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: child,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.center,
                                colors: [
                                  Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(.5),
                                  Theme.of(context)
                                      .iconTheme
                                      .color!
                                      .withOpacity(.2),
                                  Colors.transparent,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Constants.defaultPadding,
                          right: Constants.defaultPadding,
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                editor: (value) => value == null
                    ? const Loading()
                    : Image.asset(
                        value.path,
                        fit: BoxFit.cover,
                        errorBuilder: (context, err, stacktrace) =>
                            UserContent.placeholderIcon,
                      ),
                child: Image.network(
                  user.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, err, stacktrace) =>
                      UserContent.placeholderIcon,
                ),
              ),
              const SizedBox(height: Constants.defaultPadding),
              CustomEditableText(
                value: user.title,
                help: Language.userTitleHelp,
                label: Language.userTitle,
                onSave: (value) => user.title = value,
              ),
              CustomEditableText(
                value: user.caption,
                help: Language.userCaptionHelp,
                label: Language.userCaption,
                onSave: (value) => user.caption = value,
              ),
              CustomEditableText(
                value: user.email,
                help: Language.userCaptionHelp,
                label: Language.userCaption,
                onSave: (value) => user.email = value,
                maxLength: 100,
              ),
              const SizedBox(height: Constants.defaultPadding),
              CustomSwitch(
                label: Language.userPrivacy,
                switchText: Language.userPrivacyAction,
                help: Language.userPrivacyHelp,
                value: user.private,
                onSave: (value) => user.private = value,
              ),
              const SizedBox(height: Constants.defaultPadding),
              const CustomEditable(
                label: Language.settingsVisualBrightness,
                content: ThemeSwitcher(),
              ),
              const SizedBox(height: Constants.defaultPadding),
              const CustomEditable(
                label: Language.settingsNotosAlarm,
                content: StoredPreferenceSwitcher(
                  keyName: SettingsKeyValues.settingsNotosAlarm,
                ),
              ),
              const SizedBox(height: Constants.defaultPadding),
              const CustomEditable(
                label: Language.settingsCalendarEventType,
                content: StoredPreferenceSwitcher(
                  keyName: SettingsKeyValues.settingsCalendarEventType,
                ),
              ),
              const SizedBox(height: Constants.defaultPadding),
              const Text(
                Language.friends,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: Constants.defaultPadding / 2),
              VerticalUserList(
                user.followingListContent,
              ),
              const SizedBox(height: Constants.defaultPadding),
              ElevatedButton(
                onPressed: () => AlertTextDialog.run(
                  context,
                  const AlertTextDialog(
                    alert: 'needs to be fixed',
                    subtext: 'OurTeamMembers',
                  ),
                ),
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
                  Language.removeAccount,
                ),
              ),
              const SizedBox(height: Constants.defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
