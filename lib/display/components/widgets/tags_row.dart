import 'package:flutter/material.dart';
import 'package:start_frontend/language/constants.dart';

class ChipTagsRow extends StatelessWidget {
  final List<String> tags;
  final Function action;
  final bool small;

  const ChipTagsRow({
    required this.tags,
    required this.action,
    this.small = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
        children: Set.from(tags)
            .toList()
            .map(
              (tag) => GestureDetector(
                onTap: () => action(),
                child: Container(
                  margin: tags.indexOf(tag) == tags.length - 1
                      ? EdgeInsets.zero
                      : EdgeInsets.only(
                          right: small
                              ? Constants.defaultPadding / 4
                              : Constants.defaultPadding,
                        ),
                  child: Chip(
                    label: Text(
                      tag,
                      style: TextStyle(
                        color: Constants.chipText,
                        fontSize: small ? 12 : 18,
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
