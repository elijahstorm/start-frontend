import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/profile/large_icon_button.dart';
import 'package:start_app_frontend/display/components/profile/long_profile_tile.dart';
import 'package:start_app_frontend/display/components/profile/progress_card.dart';
import 'package:start_app_frontend/display/components/profile/temp_profile_content.dart';
import 'package:start_app_frontend/display/components/widgets/content_card.dart';
import 'package:start_app_frontend/display/components/widgets/row_with_header.dart';
import 'package:start_app_frontend/display/components/widgets/short_column_with_header.dart';
import 'package:start_app_frontend/language/constants.dart';

class ProfileColumn extends StatelessWidget {
  final ProfileContent profile;
  final double width = 250;
  final double height = 150;

  const ProfileColumn({
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Constants.defaultPadding,
            ),
            child: LongProfileTile(
              profile: profile,
            ),
          ),
          if (!profile.premium)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: GestureDetector(
                onTap: () => {},
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      6,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(Constants.defaultPadding),
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  size: 20,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                Text(
                                  ' Upgrade to ',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                                Text(
                                  'Premiumn STAR:T',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Constants.defaultPadding / 4,
                            ),
                            const Text(
                              'Enjoy STAR:T classes without ads and restrictions',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 36,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding * 2,
              vertical: Constants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LargeIconButton(
                  icon: Icons.favorite_border,
                  title: 'Favorites',
                ),
                LargeIconButton(
                  icon: Icons.calendar_today_outlined,
                  title: 'Schedule',
                ),
                LargeIconButton(
                  icon: Icons.people_outline,
                  title: 'My Avatar',
                ),
              ],
            ),
          ),
          const Divider(),
          RowWithHeader(
            name: 'My Videos',
            children: [
              ContentCard(
                title: 'After LIKE',
                width: width,
                height: height,
                positionedChildren: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imports/profile/After LIKE.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width * .78,
                        height: 5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                action: () => {},
              ),
              ContentCard(
                title: 'Funky Glitter Christmas',
                width: width,
                height: height,
                positionedChildren: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imports/profile/dance room.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    left: width * .4,
                    child: Image.asset(
                      'assets/imports/profile/anna.png',
                    ),
                  ),
                  Positioned.fill(
                    left: -width * .35,
                    child: Image.asset(
                      'assets/imports/profile/dancer girl.png',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width * .34,
                        height: 5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                action: () => {},
              ),
            ],
            action: () => {},
          ),
          const SizedBox(height: Constants.defaultPadding),
          const Divider(),
          RowWithHeader(
            name: 'History',
            children: [
              ContentCard(
                title: 'After LIKE',
                subtitle: 'IVE',
                width: width,
                height: height,
                positionedChildren: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imports/profile/ive.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width * .78,
                        height: 5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                action: () => {},
              ),
              ContentCard(
                title: 'Funky Glitter Christmas',
                subtitle: 'NMIXX',
                width: width,
                height: height,
                positionedChildren: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imports/profile/mnixx.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width * .34,
                        height: 5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                action: () => {},
              ),
              ContentCard(
                title: 'CASE 143',
                subtitle: 'Stray Kids',
                width: width,
                height: height,
                positionedChildren: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imports/profile/stray kids.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width * .56,
                        height: 5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                action: () => {},
              ),
            ],
            action: () => {},
          ),
          const SizedBox(height: Constants.defaultPadding),
          const Divider(),
          ShortColumnWithHeader(
            name: 'Dance Missions',
            gap: Constants.defaultPadding / 2,
            children: const [
              ProgressCard(
                title: 'Win in 3 Dance Battles',
                completed: 1,
                total: 3,
              ),
              ProgressCard(
                title: 'Add 5 Friends from Dance Classes',
                completed: 2,
                total: 5,
              ),
              ProgressCard(
                title: 'Go Live on your Dream Stage',
                completed: 5,
                total: 5,
              ),
            ],
            action: () => {},
          ),
        ],
      );
}
