import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/meetup/temp_location_content.dart';
import 'package:start_app_frontend/language/constants.dart';

class SmallLocationTile extends StatelessWidget {
  final LocationContent location;
  final double smallTextSize = 12;

  const SmallLocationTile({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 300,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              location.image,
              width: 100,
              height: 60,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: Constants.defaultPadding,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.title,
                    overflow: TextOverflow.ellipsis,
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
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: smallTextSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
