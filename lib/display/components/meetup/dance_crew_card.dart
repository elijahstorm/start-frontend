import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/meetup/temp_crew_content.dart';
import 'package:start_app_frontend/display/components/widgets/tall_content_card.dart';

class DanceCrewCard extends StatelessWidget {
  final DanceCrewContent crew;

  const DanceCrewCard({
    required this.crew,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TallContentCard(
        image: crew.image,
        width: 160,
        height: 200,
        title: crew.title,
        subtitle: crew.location,
        prefixIcon: Icons.location_on_outlined,
        tags: crew.tags,
        action: () => {},
      );
}
