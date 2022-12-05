import 'package:flutter/material.dart';
import 'package:start_app_frontend/display/components/classes/TempClassContent.dart';
import 'package:start_app_frontend/display/components/classes/class_card.dart';
import 'package:start_app_frontend/language/constants.dart';

class ClassesRow extends StatelessWidget {
  final String name;
  final List<ClassContent> classes;
  final bool shortClasses;

  const ClassesRow({
    required this.name,
    required this.classes,
    this.shortClasses = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding,
            ),
            child: Row(
              children: classes
                  .map(
                    (theClass) => ClassCard(
                      theClass: theClass,
                      shortClasses: shortClasses,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
}
