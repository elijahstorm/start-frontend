import 'package:flutter/material.dart';
import 'package:start_frontend/display/components/teams/horizontal_user_card.dart';
import 'package:start_frontend/display/components/widgets/alerts.dart';
import 'package:start_frontend/language/language.dart';
import 'package:provider/provider.dart';

import 'package:start_frontend/controllers/responsive.dart';
import 'package:start_frontend/content/users/cache.dart';
import 'package:start_frontend/language/constants.dart';

class UserRecommendedFriends extends StatelessWidget {
  const UserRecommendedFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Language.appScreenHeaderYourCircle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.defaultPadding * 1.5,
                  vertical: Constants.defaultPadding /
                      (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () => AlertTextDialog.run(
                context,
                const AlertTextDialog(
                  alert: 'needs to be fixed',
                  subtext: 'OurTeamMembers',
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text(Language.findMoreButton),
            ),
          ],
        ),
        const SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: PersonCardInfoGridView(
            crossAxisCount: size.width < 650 ? 2 : 2,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const PersonCardInfoGridView(),
          desktop: PersonCardInfoGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class PersonCardInfoGridView extends StatelessWidget {
  const PersonCardInfoGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) => Consumer<UserCache>(
        builder: (context, cache, child) => Column(
          children: List.generate(
            cache.items.length,
            (index) => HorizontalUserCard(
              cache.items[index],
            ),
          ),
        ),
      );
}
