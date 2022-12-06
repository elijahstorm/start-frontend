import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/play/temp_dance_play_content.dart';
import 'package:start_app_frontend/display/components/widgets/content_card.dart';
import 'package:start_app_frontend/language/constants.dart';

class DancePlayCard extends StatelessWidget {
  final DancePlayContent game;

  const DancePlayCard({
    required this.game,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ContentCard(
        width: 200,
        height: 200,
        title: game.title,
        positionedChildren: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              game.images[0],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              game.images[1],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              game.images[2],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              game.images[3],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          if (game.locked)
            Positioned.fill(
              child: Container(
                color: const Color(0x66000000),
                child: const Center(
                  child: Icon(
                    Icons.lock_outlined,
                    color: Constants.textColorDark,
                    size: 50,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: .7,
              child: Container(
                width: 256,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Constants.chipText,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Constants.defaultPadding,
            bottom: Constants.defaultPadding,
            child: Text(
              '${game.songAmount} songs',
              style: const TextStyle(
                color: Constants.textColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
        tags: game.tags,
        action: () => {},
      );
}
