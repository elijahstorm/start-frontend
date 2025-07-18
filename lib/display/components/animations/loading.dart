import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:start_frontend/display/components/widgets/avatars.dart';
import 'package:start_frontend/language/constants.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: SpinKitDancingSquare(
          color: Theme.of(context).colorScheme.secondary,
          size: 50.0,
        ),
      );
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: SpinKitDancingSquare(
          color: Theme.of(context).colorScheme.secondary,
          size: 20.0,
        ),
      );
}

class LoadingAvatar extends CircleOverlappableAvatar {
  LoadingAvatar({
    double? size = Constants.defaultPadding,
    Key? key,
  }) : super(
          key: key,
          display: Center(
            child: SpinKitCircle(
              color: Constants.primaryColorLight,
              size: size ?? Constants.defaultPadding,
            ),
          ),
        );
}
