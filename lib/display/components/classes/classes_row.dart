import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/classes/temp_class_content.dart';
import 'package:start_app_frontend/display/components/classes/class_card.dart';
import 'package:start_app_frontend/display/components/widgets/row_with_header.dart';

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
  Widget build(BuildContext context) => RowWithHeader(
        name: name,
        children: classes
            .map(
              (theClass) => ClassCard(
                theClass: theClass,
                shortClasses: shortClasses,
              ),
            )
            .toList(),
      );
}
