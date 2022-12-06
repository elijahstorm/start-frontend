import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/play/temp_dance_play_content.dart';
import 'package:start_app_frontend/display/components/play/play_row.dart';
import 'package:start_app_frontend/display/components/widgets/card_button.dart';
import 'package:start_app_frontend/display/components/widgets/row_with_header.dart';

class AllPlayColumn extends StatelessWidget {
  const AllPlayColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowWithHeader(
            children: [
              CardButton(
                name: 'Dance Battle',
                icon: Icons.gamepad_outlined,
                action: () => {},
              ),
              CardButton(
                name: 'Random Play Dance',
                icon: Icons.music_note_outlined,
                action: () => {},
              ),
              CardButton(
                name: 'Dream Stage',
                icon: Icons.lightbulb_outline_sharp,
                action: () => {},
              ),
            ],
          ),
          DancePlayRow(
            name: 'Popular Dance Battle',
            games: [
              DancePlayContent(
                images: [
                  'assets/imports/games/icecream.png',
                  'assets/imports/games/ineverdie.png',
                  'assets/imports/games/eleven.png',
                  'assets/imports/games/bp.png',
                ],
                title: 'Girl Group Dance',
                tags: [
                  'Powerful',
                  'Rhythmical',
                ],
                songAmount: 12,
                likes: 321,
              ),
              DancePlayContent(
                images: [
                  'assets/imports/games/5hinee.png',
                  'assets/imports/games/redvelvet.png',
                  'assets/imports/games/house.png',
                  'assets/imports/games/joy.png',
                ],
                title: '2022\'s K-Pop Hits',
                tags: [
                  'Cool',
                  'Energetic',
                ],
                songAmount: 21,
                likes: 321,
              ),
              DancePlayContent(
                images: [
                  'assets/imports/games/sticker.png',
                  'assets/imports/games/nct.png',
                  'assets/imports/games/5hinee.png',
                  'assets/imports/games/joy.png',
                ],
                title: 'Solo Artist',
                tags: [
                  'Solo',
                  'Active',
                ],
                songAmount: 23,
                likes: 321,
              ),
            ],
          ),
          DancePlayRow(
            name: 'Just The Hits',
            games: [
              DancePlayContent(
                images: [
                  'assets/imports/games/dontcallme.png',
                  'assets/imports/games/savage.png',
                  'assets/imports/games/diamond.png',
                  'assets/imports/games/nct.png',
                ],
                title: 'SM Dance Medley',
                tags: [
                  'Powerful',
                  'Rhythmical',
                ],
                songAmount: 12,
                likes: 321,
              ),
              DancePlayContent(
                images: [
                  'assets/imports/games/bts.png',
                  'assets/imports/games/parley.png',
                  'assets/imports/games/odd.png',
                  'assets/imports/games/star.png',
                ],
                title: 'Summer K-Pop',
                tags: [
                  'Highteen',
                  'Active',
                ],
                songAmount: 21,
                likes: 321,
              ),
              DancePlayContent(
                images: [
                  'assets/imports/games/hypeboy.png',
                  'assets/imports/games/joy.png',
                  'assets/imports/games/savage.png',
                  'assets/imports/games/bts.png',
                ],
                title: '2022\'s Hits',
                tags: [
                  'Hip-Hop',
                  'Active',
                ],
                songAmount: 23,
                likes: 321,
              ),
            ],
          ),
        ],
      );
}
