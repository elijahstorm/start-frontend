import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/login/user_state.dart';
import 'package:start_frontend/language/language.dart';
import 'package:start_frontend/content/teams/cache.dart';
import 'package:start_frontend/content/teams/content.dart';
import 'package:start_frontend/display/components/widgets/avatars.dart'
    show CircleStoryAvatar;

import 'package:start_frontend/language/constants.dart';

class TeamMemberSmallCircleRow extends StatelessWidget {
  const TeamMemberSmallCircleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<TeamsCache>(
        builder: (context, cache, child) => Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(
                  cache.items.length + 1,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding / 2,
                    ),
                    child: index == 0
                        ? AddMoreTeamsButton(
                            cache,
                          )
                        : TeamDisplay(cache.items[index - 1]),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class TeamDisplay extends CircleStoryAvatar {
  final TeamContent team;

  TeamDisplay(
    this.team, {
    Key? key,
  }) : super(
          key: key,
          label: team.title,
          navigateTo: team.navigateTo,
          display: team.icon,
        );
}

class AddMoreTeamsButton extends CircleStoryAvatar {
  final TeamsCache cache;
  final UserState? userstate;

  const AddMoreTeamsButton(
    this.cache, {
    this.userstate,
    Key? key,
  }) : super(
          key: key,
          label: Language.makeNewButton,
          navigateTo: TeamContent.makeNewTeam,
          display: const Icon(Icons.add),
        );
}
