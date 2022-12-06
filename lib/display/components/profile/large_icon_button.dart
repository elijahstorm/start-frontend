import 'package:flutter/material.dart';
import 'package:start_app_frontend/language/constants.dart';

class LargeIconButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const LargeIconButton({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => {},
        child: Column(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                child: Icon(
                  icon,
                  size: 30,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            const SizedBox(
              height: Constants.defaultPadding / 2,
            ),
            Text(
              title,
            ),
          ],
        ),
      );
}
