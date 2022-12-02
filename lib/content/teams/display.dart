import 'package:flutter/material.dart';

import 'package:start_app_frontend/display/components/teams/team_page.dart';

import 'content.dart';

class TeamContentDisplayPage extends StatelessWidget {
  final TeamContent content;

  const TeamContentDisplayPage(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TeamPageDisplay(content);
}
