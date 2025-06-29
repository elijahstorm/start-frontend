import 'package:flutter/material.dart';

import 'package:start_frontend/controllers/responsive.dart';
import 'package:start_frontend/language/constants.dart';
import 'package:start_frontend/display/components/animations/blinking_content.dart';
import 'package:start_frontend/display/components/animations/loading.dart';
import 'package:start_frontend/language/language.dart';

class NoContentPlaceholder extends StatelessWidget {
  const NoContentPlaceholder({
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
            BlinkingContent(
              child: Text(
                Language.waitingForContent,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: NoContentFunSquare(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const NoContentFunSquare(),
          desktop: NoContentFunSquare(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class NoContentFunSquare extends StatelessWidget {
  const NoContentFunSquare({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: Constants.defaultPadding,
        mainAxisSpacing: Constants.defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Loading(),
      ),
    );
  }
}
