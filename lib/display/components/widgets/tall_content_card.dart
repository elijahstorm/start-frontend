import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/widgets/tags_row.dart';
import 'package:start_app_frontend/language/constants.dart';

class TallContentCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final IconData? prefixIcon;
  final double width;
  final double height;
  final List<String> tags;
  final Function action;
  final double headerSize;
  final double subtitleSize;

  const TallContentCard({
    required this.image,
    required this.title,
    this.subtitle = '',
    this.prefixIcon,
    this.tags = const [],
    this.width = 200,
    this.height = 200,
    required this.action,
    this.headerSize = 20,
    this.subtitleSize = 14,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => action(),
        child: SizedBox(
          width: width,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                6,
              ),
            ),
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: .7,
                      child: Container(
                        width: width,
                        height: height * .75,
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
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.defaultPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: headerSize,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                          if (subtitle != '')
                            Row(
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
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (tags.isNotEmpty)
                            Theme(
                              data: ThemeData(
                                  canvasColor: Constants.chipTransparent),
                              child: Chip(
                                backgroundColor: Constants.chipTransparent,
                                padding: const EdgeInsets.all(0),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                label: Text(
                                  tags[0],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
