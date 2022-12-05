import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/classes/TempClassContent.dart';
import 'package:start_app_frontend/language/constants.dart';

class ClassCard extends StatelessWidget {
  final ClassContent theClass;
  final bool shortClasses;

  const ClassCard({
    required this.theClass,
    required this.shortClasses,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          right: Constants.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  6,
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    theClass.image,
                    width: shortClasses ? 195 : 256,
                    height: shortClasses ? 286 : 160,
                    fit: BoxFit.fill,
                  ),
                  if (theClass.locked)
                    Positioned(
                      child: Positioned.fill(
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
              ),
            ),
            const SizedBox(height: Constants.defaultPadding / 2),
            Text(
              theClass.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: Constants.defaultPadding / 4),
            Opacity(
              opacity: .7,
              child: Text(
                theClass.group,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: Constants.defaultPadding / 4),
            Row(
              children: theClass.tags
                  .map(
                    (tag) => Container(
                      margin: const EdgeInsets.only(
                        right: Constants.defaultPadding,
                      ),
                      child: Chip(
                        label: Text(
                          tag,
                          style: const TextStyle(
                            color: Constants.chipText,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        backgroundColor: Constants.chipBackground,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: Constants.defaultPadding),
          ],
        ),
      );
}
