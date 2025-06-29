import 'package:flutter/material.dart';

import 'package:start_frontend/language/constants.dart';

class CardButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function action;

  const CardButton({
    required this.name,
    required this.icon,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => action(),
        child: Container(
          width: 120,
          height: 110,
          margin: const EdgeInsets.only(bottom: Constants.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      );
}
