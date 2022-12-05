import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:start_app_frontend/main.dart';
import 'package:start_app_frontend/language/constants.dart';

void main() {
  testWidgets('Log in demo account test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HajaDoTogetherApp());

    await tester.tap(find.widgetWithImage(
        GestureDetector, const AssetImage(Constants.logoAsset)));
    await tester.tap(find.widgetWithImage(
        GestureDetector, const AssetImage(Constants.logoAsset)));
    await tester.pump();
  });
}
