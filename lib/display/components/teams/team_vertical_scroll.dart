import 'package:flutter/material.dart';

import 'package:start_app_frontend/language/constants.dart';
import 'package:start_app_frontend/language/language.dart';
import 'package:start_app_frontend/content/teams/cache.dart';
import 'package:start_app_frontend/display/components/teams/team_card.dart';
import 'package:provider/provider.dart';

class TeamContentVerticalList extends StatelessWidget {
  const TeamContentVerticalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Language.teamCacheListHeader,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Consumer<TeamsCache>(
              builder: (context, cache, child) {
                if (cache.items.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Constants.defaultPadding,
                        ),
                        child: Image.asset(Constants.noTeamsPlaceholder),
                      ),
                      const Text(
                        Language.noTeamsPlaceholder,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.defaultPadding,
                  ),
                  child: Column(
                    children: List.generate(
                      cache.items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: Constants.defaultPadding,
                        ),
                        child: TeamCard(cache.items[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
}
