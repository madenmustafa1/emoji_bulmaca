import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobWidgets {
  static Container adBanner(BannerAd banner) {
    AdWidget adWidget = AdWidget(ad: banner);

    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: banner.size.width.toDouble(),
      height: banner.size.height.toDouble(),
    );
    return adContainer;
  }
}
