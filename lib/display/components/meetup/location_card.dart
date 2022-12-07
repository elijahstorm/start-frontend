import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/meetup/temp_location_content.dart';
import 'package:start_app_frontend/display/components/widgets/content_card.dart';

class LocationCard extends StatelessWidget {
  final LocationContent location;

  const LocationCard({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ContentCard(
        width: 200,
        height: 140,
        title: location.title,
        subtitle: location.location,
        headerStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitleSize: 14,
        prefixIcon: Icons.location_on_outlined,
        positionedChildren: [
          Positioned.fill(
            child: Image.asset(
              location.image,
              fit: BoxFit.fill,
            ),
          ),
        ],
        action: () => {},
      );
}
