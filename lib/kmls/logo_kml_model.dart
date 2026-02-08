// SKELETON: Liquid Galaxy logo overlay KML builder.
//
// This builder generates a ScreenOverlay KML for displaying
// the Liquid Galaxy logo on cluster screens.
//
// NOTE:
// The image link is intentionally kept as-is, as requested.

import 'kml_feature.dart';
import 'common_kml.dart';

class KmlLogo
    implements
        KmlFeature {
  /// Generates a full KML document containing a ScreenOverlay
  /// with the Liquid Galaxy logo.
  ///
  /// SKELETON RULES:
  /// - This method must return a complete KML document.
  /// - Agents may add parameters (position, size, visibility),
  ///   but must preserve backward compatibility.
  static String generateKml() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>
    lg logo
  </name>
  <ScreenOverlay>
    <name>
      lg overlay
    </name>
    <visibility>
      1
    </visibility>
    <Icon>
      <href>
        https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXmdNgBTXup6bdWew5RzgCmC9pPb7rK487CpiscWB2S8OlhwFHmeeACHIIjx4B5-Iv-t95mNUx0JhB_oATG3-Tq1gs8Uj0-Xb9Njye6rHtKKsnJQJlzZqJxMDnj_2TXX3eA5x6VSgc8aw/s320-rw/LOGO+LIQUID+GALAXY-sq1000-+OKnoline.png
      </href>
    </Icon>
    <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
    <screenXY x="0" y="1" xunits="fraction" yunits="fraction"/>
    <size x="240" y="160" xunits="pixels" yunits="pixels"/>
  </ScreenOverlay>
</Document>
</kml>''';
  }

  /// New unified contract used by the LG KML pipeline.
  /// This keeps compatibility with the old static generator.
  @override
  KmlPayload build() {
    return const KmlPayload(
      kml: _kmlDocument,
      // Logo overlay does not move the camera.
      // These are safe neutral defaults.
      latitude: 0.0,
      longitude: 0.0,
      range: 0.0,
    );
  }

  // Internal constant so agents can refactor safely later.
  static const String _kmlDocument = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>
    lg logo
  </name>
  <ScreenOverlay>
    <name>
      lg overlay
    </name>
    <visibility>
      1
    </visibility>
    <Icon>
      <href>
        https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXmdNgBTXup6bdWew5RzgCmC9pPb7rK487CpiscWB2S8OlhwFHmeeACHIIjx4B5-Iv-t95mNUx0JhB_oATG3-Tq1gs8Uj0-Xb9Njye6rHtKKsnJQJlzZqJxMDnj_2TXX3eA5x6VSgc8aw/s320-rw/LOGO+LIQUID+GALAXY-sq1000-+OKnoline.png
      </href>
    </Icon>
    <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
    <screenXY x="0" y="1" xunits="fraction" yunits="fraction"/>
    <size x="240" y="160" xunits="pixels" yunits="pixels"/>
  </ScreenOverlay>
</Document>
</kml>''';
}
