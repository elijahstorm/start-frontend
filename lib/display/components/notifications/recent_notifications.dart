import 'package:flutter/material.dart';
import 'package:start_app_frontend/content/users/content.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:start_app_frontend/content/notifications/content.dart';
import 'package:start_app_frontend/content/notifications/cache.dart';
import 'package:start_app_frontend/language/constants.dart';
import 'package:start_app_frontend/language/language.dart';

class RecentNotifications extends StatelessWidget {
  final _notificationContainerSize = 50.0;

  const RecentNotifications({
    Key? key,
  }) : super(key: key);

  void _delete(NotificationCache cache, int index) {
    var item = cache.items[index];
    item.delete();
    cache.remove(item);
  }

  Widget _buildNotificationList(
    BuildContext context,
    NotificationCache cache,
  ) =>
      cache.items.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.defaultPadding,
                  ),
                  child: Image.asset(Constants.noNotosPlaceholder),
                ),
                const Text(
                  Language.noNotosPlaceholder,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Column(
              children: List.generate(
                cache.items.length,
                (index) => GestureDetector(
                  onTap: () {
                    cache.items[index].navigateTo(context);
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: Language.deleteButton,
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) {
                            _delete(cache, index);
                          },
                        ),
                      ],
                    ),
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: Language.deleteButton,
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) {
                            _delete(cache, index);
                          },
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: index == cache.items.length - 1
                            ? 0
                            : Constants.defaultPadding,
                      ),
                      child:
                          _buildNotificationItem(context, cache.items[index]),
                    ),
                  ),
                ),
              ),
            );

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationContent classes,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          classes.hasStory
              ? Container(
                  width: _notificationContainerSize,
                  height: _notificationContainerSize,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: FutureBuilder<UserContent?>(
                        future: classes.from,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return UserContent.placeholderIcon;
                          }

                          return snapshot.data!.icon;
                        },
                      ),
                    ),
                  ),
                )
              : Container(
                  width: _notificationContainerSize,
                  height: _notificationContainerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    child: FutureBuilder<UserContent?>(
                      future: classes.from,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return UserContent.placeholderIcon;
                        }

                        return snapshot.data!.icon;
                      },
                    ),
                  ),
                ),
          const SizedBox(width: Constants.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        classes.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Constants.defaultPadding / 4,
                    ),
                    Text(
                      Language.timeSinceDate(
                        classes.date,
                        short: true,
                      ),
                      style: TextStyle(
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
                Text(
                  classes.caption,
                ),
              ],
            ),
          ),
          const SizedBox(width: Constants.defaultPadding),
          classes.postImage != null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: _notificationContainerSize,
                  height: _notificationContainerSize,
                  child: ClipRRect(
                    child: classes.postImage,
                  ),
                )
              : GestureDetector(
                  onTap: () async => (await classes.from)?.follow(),
                  child: Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        Language.followButton,
                        style: TextStyle(
                          color: Constants.bgColorLight,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      );

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Language.appScreenHeaderRecentNotos,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: Constants.defaultPadding),
          Consumer<NotificationCache>(
            builder: (context, cache, child) => _buildNotificationList(
              context,
              cache,
            ),
          ),
        ],
      );
}
