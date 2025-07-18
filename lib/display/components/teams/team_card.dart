import 'package:flutter/material.dart';

import 'package:start_frontend/content/teams/content.dart';
import 'package:start_frontend/display/components/teams/team_user_avatars.dart';
import 'package:start_frontend/language/constants.dart';

class TeamCard extends StatelessWidget {
  final TeamContent team;

  const TeamCard(
    this.team, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          Constants.defaultBorderRadiusXLarge,
        ),
      ),
      child: GestureDetector(
        onTap: () => team.navigateTo(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: team.responsiveImage,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Theme.of(context).iconTheme.color!.withOpacity(.7),
                            Theme.of(context).iconTheme.color!.withOpacity(.5),
                            Colors.transparent,
                            Theme.of(context).iconTheme.color!.withOpacity(.2),
                            Theme.of(context).iconTheme.color!.withOpacity(.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: Constants.defaultPadding,
                    bottom: Constants.defaultPadding,
                    child: Text(
                      team.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: Constants.defaultPadding,
                    bottom: Constants.defaultPadding,
                    child: Row(
                      children: [
                        UserAvatarStack(
                          team.usersContent,
                          onTap: () => team.navigateToEditor(context),
                        ),
                        const SizedBox(
                          width: Constants.defaultPadding / 2,
                        ),
                        Opacity(
                          opacity: .8,
                          child: Text(
                            team.users.length.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: Constants.defaultPadding,
                    top: Constants.defaultPadding / 2,
                    child: Opacity(
                      opacity: .7,
                      child: GestureDetector(
                        child: Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        onTap: () => team.navigateToEditor(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
