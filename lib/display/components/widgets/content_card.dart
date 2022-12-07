import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/widgets/tags_row.dart';
import 'package:start_app_frontend/language/constants.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? prefixIcon;
  final double width;
  final double height;
  final List<Positioned> positionedChildren;
  final List<String> tags;
  final Function action;
  final TextStyle headerStyle;
  final double subtitleSize;

  const ContentCard({
    required this.title,
    this.subtitle = '',
    this.prefixIcon,
    required this.positionedChildren,
    this.tags = const [],
    this.width = 200,
    this.height = 200,
    required this.action,
    this.headerStyle = const TextStyle(
      fontSize: 24,
    ),
    this.subtitleSize = 20,
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
                style: headerStyle,
              ),
              if (subtitle != '')
                Opacity(
                  opacity: .7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (prefixIcon != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: Constants.defaultPadding / 4,
                          ),
                          child: Icon(
                            prefixIcon,
                            size: subtitleSize,
                          ),
                        ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: Constants.defaultPadding / 4,
                          ),
                          child: Text(
                            subtitle,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: subtitleSize,
                            ),
                          ),
                        ),
                      ),
                    ],
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
