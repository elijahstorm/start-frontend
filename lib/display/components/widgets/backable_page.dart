import 'package:flutter/material.dart';

import 'package:start_frontend/language/constants.dart';

class BackablePage extends StatelessWidget {
  final Widget _child;
  final AppBar? _appBar;

  const BackablePage({
    required child,
    appBar,
    Key? key,
  })  : _child = child,
        _appBar = appBar,
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar,
        body: Stack(
          children: [
            Positioned.fill(
              child: _child,
            ),
            Positioned(
              top: Constants.defaultPadding,
              left: Constants.defaultPadding,
              child: SafeArea(
                child: BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      );
}
