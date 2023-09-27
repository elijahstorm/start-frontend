import 'package:flutter/material.dart';

import 'package:start_frontend/display/components/play/temp_dance_play_content.dart';
import 'package:start_frontend/display/components/play/play_card.dart';
import 'package:start_frontend/display/components/widgets/row_with_header.dart';

class DancePlayRow extends StatelessWidget {
  final String name;
  final List<DancePlayContent> games;

  const DancePlayRow({
    required this.name,
    required this.games,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RowWithHeader(
        action: () => {},
        name: name,
        children: games
            .map(
              (game) => DancePlayCard(
                game: game,
              ),
            )
            .toList(),
      );
}
