import 'package:flutter/material.dart';
import 'package:start_frontend/language/constants.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final int completed;
  final int total;

  const ProgressCard({
    required this.title,
    required this.completed,
    required this.total,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => {},
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              6,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: Constants.defaultPadding * 1.5,
              top: Constants.defaultPadding / 2,
              right: Constants.defaultPadding / 1.5,
              bottom: Constants.defaultPadding / 2,
            ),
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: completed == total ? .4 : 1,
                  child: Text(
                    title,
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      3,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding / 1.5,
                      vertical: Constants.defaultPadding / 4,
                    ),
                    color: completed == total
                        ? Colors.black12
                        : Theme.of(context).primaryColor,
                    child: Text(
                      '$completed / $total',
                      style: TextStyle(
                        color: completed == total
                            ? Colors.black45
                            : Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
