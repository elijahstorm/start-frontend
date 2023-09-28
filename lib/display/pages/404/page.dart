import 'package:flutter/material.dart';

import 'package:start_frontend/display/components/widgets/error.dart';
import 'package:start_frontend/language/language.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const ErrorPage(
        header: Language.pageNotFoundError,
        help: '',
      );
}
