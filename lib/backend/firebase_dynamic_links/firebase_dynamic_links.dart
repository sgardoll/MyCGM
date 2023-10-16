import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

const _kDynamicLinksUrl = 'https://mycgm.page.link';
const _kAppBundleId = 'com.connectio.mycgm';
const _kIosAppId = '1663650386';

Future<String> generateCurrentPageLink(
  BuildContext context, {
  String? title,
  String? description,
  String? imageUrl,
  bool isShortLink = true,
  bool forceRedirect = false,
}) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse('$_kDynamicLinksUrl${GoRouter.of(context).location}'),
    uriPrefix: _kDynamicLinksUrl,
    androidParameters: const AndroidParameters(packageName: _kAppBundleId),
    iosParameters: const IOSParameters(
      bundleId: _kAppBundleId,
      appStoreId: _kIosAppId,
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: title,
      description: description,
      imageUrl: imageUrl != null ? Uri.tryParse(imageUrl) : null,
    ),
    navigationInfoParameters: forceRedirect
        ? NavigationInfoParameters(forcedRedirectEnabled: true)
        : null,
  );
  return isShortLink
      ? FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams)
          .then((link) => link.shortUrl.toString())
      : FirebaseDynamicLinks.instance
          .buildLink(dynamicLinkParams)
          .then((link) => link.toString());
}

class DynamicLinksHandler extends StatefulWidget {
  const DynamicLinksHandler({
    Key? key,
    required this.router,
    required this.child,
  }) : super(key: key);

  final GoRouter router;
  final Widget child;

  @override
  _DynamicLinksHandlerState createState() => _DynamicLinksHandlerState();
}

class _DynamicLinksHandlerState extends State<DynamicLinksHandler> {
  StreamSubscription? linkSubscription;

  static Set<String> kInitialLinks = {};

  Future handleOpenedDynamicLink() async {
    final linkData = await FirebaseDynamicLinks.instance.getInitialLink();
    final link = linkData?.link.toString();
    if (linkData != null && link != null && !kInitialLinks.contains(link)) {
      kInitialLinks.add(link);
      _handleDynamicLink(linkData);
    }
    linkSubscription ??=
        FirebaseDynamicLinks.instance.onLink.listen(_handleDynamicLink);
  }

  /// Extracts the path from the dynamic link, and routes to it.
  void _handleDynamicLink(PendingDynamicLinkData linkData) {
    final link = linkData.link.toString();
    final host = linkData.link.host;
    final location = link.split(host).last;
    widget.router.push(location);
  }

  @override
  void initState() {
    super.initState();
    if (!isWeb) {
      handleOpenedDynamicLink();
    }
  }

  @override
  void dispose() {
    linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
