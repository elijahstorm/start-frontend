import 'package:flutter/material.dart';

import 'package:start_frontend/display/components/classes/temp_class_content.dart';
import 'package:start_frontend/display/components/widgets/content_card.dart';
import 'package:start_frontend/language/constants.dart';

class ClassCard extends StatelessWidget {
  final ClassContent theClass;
  final bool shortClasses;

  const ClassCard({
    required this.theClass,
    required this.shortClasses,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ContentCard(
        width: shortClasses ? 195 : 256,
        height: shortClasses ? 286 : 160,
        title: theClass.title,
        subtitle: theClass.group,
        positionedChildren: [
          Positioned.fill(
            child: Image.asset(
              theClass.image,
              fit: BoxFit.fill,
            ),
          ),
          if (theClass.locked)
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
                width: shortClasses ? 195 : 256,
                height: shortClasses ? 183 : 80,
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
          if (!shortClasses)
            Positioned(
              left: Constants.defaultPadding / 2,
              bottom: Constants.defaultPadding / 2 - 4,
              child: Text(
                theClass.ranking.toString(),
                style: const TextStyle(
                  color: Constants.textColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 62,
                ),
              ),
            ),
          Positioned(
            right: Constants.defaultPadding,
            bottom: Constants.defaultPadding,
            child: Text(
              '${theClass.timeLength} MIN',
              style: const TextStyle(
                color: Constants.textColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            left: Constants.defaultPadding / 2,
            top: Constants.defaultPadding / 2,
            child: Theme(
              data: ThemeData(canvasColor: Constants.chipTransparent),
              child: Chip(
                backgroundColor: Constants.chipTransparent,
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                label: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Constants.textColorDark,
                      size: 16,
                    ),
                    const SizedBox(width: Constants.defaultPadding / 4),
                    Text(
                      theClass.likes.toString(),
                      style: const TextStyle(
                        color: Constants.textColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        tags: theClass.tags,
        action: () => {},
      );
}
