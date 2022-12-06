import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/widgets/tags_row.dart';
import 'package:start_app_frontend/language/constants.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double width;
  final double height;
  final List<Positioned> positionedChildren;
  final Function action;

  final List<String> tags;

  const ContentCard({
    required this.title,
    this.subtitle = '',
    required this.positionedChildren,
    this.tags = const [],
    this.width = 200,
    this.height = 200,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => action(),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    6,
                  ),
                ),
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: positionedChildren,
                  ),
                ),
              ),
              const SizedBox(height: Constants.defaultPadding / 2),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              if (subtitle != '')
                Container(
                  margin:
                      const EdgeInsets.only(top: Constants.defaultPadding / 4),
                  child: Opacity(
                    opacity: .7,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              if (tags.isNotEmpty)
                Container(
                  margin:
                      const EdgeInsets.only(top: Constants.defaultPadding / 4),
                  child: ChipTagsRow(
                    tags: tags,
                    action: () => {},
                  ),
                ),
              const SizedBox(height: Constants.defaultPadding),
            ],
          ),
        ),
      );
}
