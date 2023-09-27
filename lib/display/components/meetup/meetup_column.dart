import 'package:flutter/material.dart';
import 'package:start_frontend/display/components/meetup/dance_crew_card.dart';
import 'package:start_frontend/display/components/meetup/location_card.dart';

import 'package:start_frontend/display/components/meetup/location_tile.dart';
import 'package:start_frontend/display/components/meetup/small_meetup_tile.dart';
import 'package:start_frontend/display/components/meetup/temp_crew_content.dart';
import 'package:start_frontend/display/components/meetup/temp_location_content.dart';
import 'package:start_frontend/display/components/widgets/row_with_header.dart';
import 'package:start_frontend/display/components/widgets/short_column_with_header.dart';
import 'package:start_frontend/language/constants.dart';

class MeetupColumn extends StatelessWidget {
  final List<int> selected = const [0];
  final List<String> tags = const [
    'Nearby',
    'Upcoming',
    'Popular',
    'K-Pop',
    'Girl-Group',
    'Boy-Group',
  ];
  final List<LocationContent> locations = const [
    LocationContent(
      image: 'assets/imports/meetup/france.png',
      title: 'Girl Group Random Play Dance',
      tags: ['Paris', 'City', 'Park'],
      location: 'Piazza del Duomo',
      date: 'Thu, Dec 22',
      time: '12:00 - 14:00',
      likes: 246,
      liked: true,
    ),
    LocationContent(
      image: 'assets/imports/meetup/centennial.png',
      title: 'BTS Random Dance Play',
      tags: ['New York', 'City', 'Park'],
      location: 'Centennial Park',
      date: 'Fri, Dec 20',
      time: '18:00 - 20:00',
      likes: 1824,
      liked: true,
    ),
    LocationContent(
      image: 'assets/imports/meetup/everglades.png',
      title: 'By The River Festival',
      tags: ['Florida', 'Nature', 'Park'],
      location: 'Everglades National Park',
      date: 'Fri, Dec 20',
      time: '13:00 - 15:00',
      likes: 624,
    ),
    LocationContent(
      image: 'assets/imports/meetup/yellowstone.png',
      title: 'Yellowstone Park',
      tags: ['All Generes', 'Park'],
      location: 'Yellowstone National Park',
      date: 'Fri, Dec 20',
      time: '11:00 - 13:00',
      likes: 2913,
    ),
    LocationContent(
      image: 'assets/imports/meetup/mammoth.png',
      title: 'Ive Songs Only!',
      tags: ['Girl Group', 'Ive'],
      location: 'Mammoth Cave National Park',
      date: 'Fri, Dec 20',
      time: '12:00 - 14:00',
      likes: 913,
    ),
    LocationContent(
      image: 'assets/imports/meetup/piazza.png',
      title: 'K-Pop Boy Group Party',
      tags: ['Boy Group', 'Advanced'],
      location: 'Piazza del Duomo Park',
      date: 'Fri, Dec 20',
      time: '12:00 - 14:00',
      likes: 478,
    ),
  ];
  final List<DanceCrewContent> crews = const [
    DanceCrewContent(
      image: 'assets/imports/meetup/dancing machine.png',
      title: 'Dancing Machine',
      tags: ['Boy Group'],
      location: 'Chicago, USA',
      likes: 942,
    ),
    DanceCrewContent(
      image: 'assets/imports/meetup/badass sisters.png',
      title: 'Badass Sisters',
      tags: ['Girl Group'],
      location: 'Seattle, USA',
      likes: 752,
    ),
    DanceCrewContent(
      image: 'assets/imports/meetup/energy.png',
      title: 'Energy Dance Crew',
      tags: ['Mixed'],
      location: 'Atlanta, USA',
      likes: 385,
    ),
  ];

  const MeetupColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowWithHeader(
            name: 'Random Play Dances',
            action: () => {},
            children: tags
                .map(
                  (tag) => Chip(
                    label: Text(
                      tag,
                      style: TextStyle(
                        color: selected.contains(tags.indexOf(tag))
                            ? Constants.chipBackground
                            : Constants.chipText,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    backgroundColor: selected.contains(tags.indexOf(tag))
                        ? Constants.chipText
                        : Constants.chipBackground,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: Constants.defaultPadding),
          RowWithHeader(
            children: locations
                .map(
                  (location) => LocationCard(location: location),
                )
                .toList(),
          ),
          const SizedBox(height: Constants.defaultPadding),
          RowWithHeader(
            name: 'K-Pop Dance Crews nearby',
            action: () => {},
            children: crews
                .map(
                  (crew) => DanceCrewCard(crew: crew),
                )
                .toList(),
          ),
          const SizedBox(height: Constants.defaultPadding),
          RowWithHeader(
            name: 'Lowkey Dance Meetups nearby',
            action: () => {},
            children: [
              [
                locations[0],
                locations[1],
                locations[2],
              ],
              [
                locations[3],
                locations[4],
                locations[5],
              ],
              [
                locations[1],
                locations[4],
                locations[0],
              ],
            ]
                .map(
                  (locationGroup) => Column(
                      children: locationGroup
                          .map(
                            (location) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: Constants.defaultPadding,
                              ),
                              child: SmallLocationTile(location: location),
                            ),
                          )
                          .toList()),
                )
                .toList(),
          ),
          const SizedBox(height: Constants.defaultPadding),
          ShortColumnWithHeader(
            name: 'Random Play Dances',
            action: () => {},
            children: locations
                .map(
                  (location) => LocationTile(location: location),
                )
                .toList(),
          ),
        ],
      );
}
