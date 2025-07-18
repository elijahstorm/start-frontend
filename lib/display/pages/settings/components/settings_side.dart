import 'package:flutter/material.dart';

import 'package:start_frontend/controllers/responsive.dart';
import 'package:start_frontend/language/constants.dart';

class DashSettingsSide extends StatelessWidget {
  const DashSettingsSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Account Info',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: EmptyContainerTest(
            crossAxisCount: size.width < 650 ? 2 : 2,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const EmptyContainerTest(),
          desktop: EmptyContainerTest(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class EmptyContainerTest extends StatelessWidget {
  const EmptyContainerTest({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
