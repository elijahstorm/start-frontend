import 'package:flutter/material.dart';

import 'package:start_frontend/language/constants.dart';

class ShortColumnWithHeader extends StatelessWidget {
  final String name;
  final double? gap;
  final List<Widget> children;
  final Function? action;

  const ShortColumnWithHeader({
    this.name = '',
    this.gap,
    required this.children,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (name != '')
                Container(
                  padding: const EdgeInsets.all(Constants.defaultPadding),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              if (action != null)
                GestureDetector(
                  onTap: () => action!(),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: Constants.defaultPadding / 2,
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children
                  .map(
                    (child) => children.indexOf(child) == children.length - 1
                        ? child
                        : Container(
                            padding: EdgeInsets.only(
                              bottom: gap ?? Constants.defaultPadding,
                            ),
                            child: child,
                          ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
}
