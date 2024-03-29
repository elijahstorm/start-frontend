import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:start_frontend/display/components/widgets/painters.dart';
import 'package:start_frontend/display/components/widgets/slivers.dart';

class BorderDisplay extends StatelessWidget {
  final List<Widget> header;
  final List<Widget> children;

  const BorderDisplay({
    required this.header,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.3),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: CurvePainter(
                color: Theme.of(context).primaryColor,
                painters: [Painters.bottom],
              ),
            ),
          ),
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                CenteredAppbarWithContent(
                  background: CustomPaint(
                    painter: CurvePainter(
                      color: Theme.of(context).primaryColor,
                      painters: [Painters.top],
                    ),
                  ),
                  children: header,
                ),
                AnimationLimiter(
                  child: PaddedContentSliver(
                    children: children,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
