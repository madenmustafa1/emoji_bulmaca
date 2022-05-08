import 'dart:async';

import 'package:emoji_bulmaca/utils/admob/ad_banner_widget.dart';
import 'package:emoji_bulmaca/utils/admob/ad_mob_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../dependency_injection/setup.dart';

class ShowAd extends StatefulWidget {
  const ShowAd({Key? key}) : super(key: key);

  @override
  State<ShowAd> createState() => _ShowAdState();
}

class _ShowAdState extends State<ShowAd> {
  AdMobConstants adMobConstants = getIt<AdMobConstants>();

  late BannerAd myBanner;
  late BannerAdListener listener;

  bool showBanner = true;

  AdSize adSize = const AdSize(width: 300, height: 50);

  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: adMobConstants.getBannerId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    bannerListener();
    myBanner.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.dispose();
  }

  Container addBanner() {
    scheduleTimeout(20 * 1000);
    return AdMobWidgets.adBanner(myBanner);
  }

  @override
  Widget build(BuildContext context) {
    return showBanner ? addBanner() : const SizedBox();
  }

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    myBanner.dispose();
    showBanner = false;
    setState(() {});
  }

  void bannerListener() {
    listener = BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => {},
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => {},
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => {},
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => {},
    );
  }
}
