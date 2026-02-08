// SKELETON: Generic ScreenOverlay KML builder for the
// LG agentic Flutter starter kit.
//
// This builder is used to place arbitrary overlays
// (images / dashboards / legends) on LG cluster screens.
//
// Agents may extend this builder to support per-screen
// logic, visibility toggles and dynamic sizing.

import 'kml_feature.dart';
import 'common_kml.dart';

class ScreenOverlayKmlBuilder
    implements
        KmlFeature {
  final String name;
  final String imageUrl;

  final double overlayX;
  final double overlayY;

  final double screenX;
  final double screenY;

  final double widthPx;
  final double heightPx;

  final bool visible;

  const ScreenOverlayKmlBuilder({
    required this.name,
    required this.imageUrl,
    this.overlayX = 0,
    this.overlayY = 1,
    this.screenX = 0,
    this.screenY = 1,
    this.widthPx = 240,
    this.heightPx = 160,
    this.visible = true,
  });

  /// Backward-compatible static API
  static KmlPayload buildOverlay({
    required String name,
    required String imageUrl,
    double overlayX = 0,
    double overlayY = 1,
    double screenX = 0,
    double screenY = 1,
    double widthPx = 240,
    double heightPx = 160,
    bool visible = true,
  }) {
    return ScreenOverlayKmlBuilder(
      name: name,
      imageUrl: imageUrl,
      overlayX: overlayX,
      overlayY: overlayY,
      screenX: screenX,
      screenY: screenY,
      widthPx: widthPx,
      heightPx: heightPx,
      visible: visible,
    ).build();
  }

  @override
  KmlPayload build() {
    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>$name</name>

  <ScreenOverlay>
    <name>$name</name>
    <visibility>${visible ? 1 : 0}</visibility>

    <Icon>
      <href>$imageUrl</href>
    </Icon>

    <overlayXY x="$overlayX" y="$overlayY"
               xunits="fraction" yunits="fraction"/>

    <screenXY x="$screenX" y="$screenY"
              xunits="fraction" yunits="fraction"/>

    <size x="$widthPx" y="$heightPx"
          xunits="pixels" yunits="pixels"/>

  </ScreenOverlay>

</Document>
</kml>
''';

    return KmlPayload(
      kml: kml,
      latitude: 0.0,
      longitude: 0.0,
      range: 0.0,
    );
  }
}
