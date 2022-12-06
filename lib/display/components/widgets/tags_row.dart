import 'package:flutter/material.dart';
import 'package:start_app_frontend/language/constants.dart';

class ChipTagsRow extends StatelessWidget {
  final List<String> tags;
  final Function action;

  const ChipTagsRow({
    required this.tags,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
        children: tags
            .map(
              (tag) => GestureDetector(
                onTap: () => action(),
                child: Container(
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
              ),
            )
            .toList(),
      );
}
