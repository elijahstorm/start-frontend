import 'package:flutter/material.dart';
import 'package:start_frontend/controllers/responsive.dart';

import 'package:start_frontend/display/components/widgets/header.dart';
import 'package:start_frontend/language/language.dart';
import 'package:start_frontend/language/constants.dart';

class ResponsiveScreen extends StatelessWidget {
  final String header;
  final Widget? primaryContent;
  final Widget? secondaryContent;
  final Widget? sideContent;
  final Widget? mobileHeaderContent;
  final IconData icon;
  final Function? iconAction;
  final Widget Function(PageData) _builder;

  const ResponsiveScreen({
    this.header = '${Language.appName}: ${Language.appSubtitle}',
    this.icon = Icons.search,
    this.iconAction,
    this.primaryContent,
    this.secondaryContent,
    this.sideContent,
    this.mobileHeaderContent,
    Key? key,
  })  : _builder = drawPanels,
        super(key: key);

  const ResponsiveScreen.thirds({
    this.header = '${Language.appName}: ${Language.appSubtitle}',
    this.icon = Icons.search,
    this.iconAction,
    this.primaryContent,
    this.secondaryContent,
    this.sideContent,
    this.mobileHeaderContent,
    Key? key,
  })  : _builder = drawThirds,
        super(key: key);

  const ResponsiveScreen.landscapeFriendly({
    this.header = '${Language.appName}: ${Language.appSubtitle}',
    this.icon = Icons.search,
    this.iconAction,
    this.primaryContent,
    this.secondaryContent,
    this.sideContent,
    this.mobileHeaderContent,
    Key? key,
  })  : _builder = drawLandscape,
        super(key: key);

  static Widget drawPanels(PageData page) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.defaultPadding,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: Header(
                page.header,
                icon: page.icon,
                action: page.iconAction,
              ),
            ),
            if (page.mobileHeaderContent != null &&
                Responsive.isMobile(page.context))
              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.defaultPadding,
                ),
                child: page.mobileHeaderContent,
              ),
            const SizedBox(
              height: Constants.defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Divider(),
                      page.primaryContent ?? Container(),
                      const SizedBox(height: Constants.defaultPadding),
                      page.secondaryContent ?? Container(),
                      if (Responsive.isMobile(page.context))
                        const SizedBox(height: Constants.defaultPadding),
                      if (Responsive.isMobile(page.context))
                        page.sideContent ?? Container(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(page.context))
                  const SizedBox(width: Constants.defaultPadding),
                if (!Responsive.isMobile(page.context))
                  Expanded(
                    flex: 2,
                    child: page.sideContent ?? Container(),
                  ),
              ],
            ),
          ],
        ),
      );

  static Widget drawLandscape(PageData page) {
    return MediaQuery.of(page.context).orientation == Orientation.landscape
        ? Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Column(
              children: [
                if (page.header != '')
                  Header(
                    page.header,
                    icon: page.icon,
                    action: page.iconAction,
                  ),
                const SizedBox(height: Constants.defaultPadding),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              if (Responsive.isMobile(page.context))
                                page.mobileHeaderContent ?? Container(),
                              page.primaryContent ?? Container(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: Constants.defaultPadding,
                      ),
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: page.secondaryContent ?? Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : drawPanels(
            PageData(
              page.context,
              page.header,
              icon: page.icon,
              iconAction: page.iconAction,
              primaryContent: page.primaryContent,
              secondaryContent: page.secondaryContent,
              sideContent: page.sideContent,
              mobileHeaderContent: page.mobileHeaderContent,
            ),
          );
  }

  static Widget drawThirds(PageData page) {
    if (Responsive.isMobile(page.context)) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.defaultPadding,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: Header(
                page.header,
                icon: page.icon,
                action: page.iconAction,
              ),
            ),
            const SizedBox(height: Constants.defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: page.mobileHeaderContent ?? Container(),
            ),
            const SizedBox(height: Constants.defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: page.primaryContent ?? Container(),
            ),
            const SizedBox(height: Constants.defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: page.secondaryContent ?? Container(),
            ),
            const SizedBox(height: Constants.defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
              ),
              child: page.sideContent ?? Container(),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(Constants.defaultPadding),
      child: Column(
        children: [
          Header(
            page.header,
            icon: page.icon,
            action: page.iconAction,
          ),
          const SizedBox(height: Constants.defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Constants.defaultPadding),
                  child: page.primaryContent ?? Container(),
                ),
              ),
              const SizedBox(width: Constants.defaultPadding),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Constants.defaultPadding),
                  child: page.secondaryContent ?? Container(),
                ),
              ),
              const SizedBox(width: Constants.defaultPadding),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Constants.defaultPadding),
                  child: page.sideContent ?? Container(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _builder(PageData(
        context,
        header,
        icon: icon,
        iconAction: iconAction,
        primaryContent: primaryContent,
        secondaryContent: secondaryContent,
        sideContent: sideContent,
        mobileHeaderContent: mobileHeaderContent,
      )),
    );
  }
}

class PageData {
  final BuildContext context;
  final String header;
  final IconData icon;
  final Function? iconAction;
  final Widget? primaryContent;
  final Widget? secondaryContent;
  final Widget? sideContent;
  final Widget? mobileHeaderContent;

  const PageData(
    this.context,
    this.header, {
    required this.icon,
    this.iconAction,
    this.primaryContent,
    this.secondaryContent,
    this.sideContent,
    this.mobileHeaderContent,
  });
}
