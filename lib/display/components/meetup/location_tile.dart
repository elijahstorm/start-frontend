import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/meetup/temp_location_content.dart';
import 'package:start_app_frontend/display/components/widgets/tags_row.dart';
import 'package:start_app_frontend/language/constants.dart';

class LocationTile extends StatelessWidget {
  final LocationContent location;
  final double smallTextSize = 12;

  const LocationTile({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            location.image,
            width: 140,
            height: 90,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: Constants.defaultPadding,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding / 4,
                ),
                Opacity(
                  opacity: .7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        location.date,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: smallTextSize,
                        ),
                      ),
                      const SizedBox(
                        width: Constants.defaultPadding / 4,
                      ),
                      Text(
                        location.time,
                        style: TextStyle(
                          fontSize: smallTextSize,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding / 4,
                ),
                Opacity(
                  opacity: .7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: Constants.defaultPadding / 4,
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          size: smallTextSize,
                        ),
                      ),
                      Text(
                        location.location,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: smallTextSize,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Constants.defaultPadding / 4,
                ),
                ChipTagsRow(
                  tags: location.tags,
                  small: true,
                  action: () => {},
                ),
              ],
            ),
          ),
          const SizedBox(
            width: Constants.defaultPadding,
          ),
          Icon(
            location.liked ? Icons.favorite : Icons.favorite_border,
            color: location.liked
                ? Theme.of(context).primaryColor
                : Theme.of(context).iconTheme.color,
            size: 26,
          ),
        ],
      );
}
