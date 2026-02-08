import 'common_kml.dart';

/// All KML feature builders must implement this interface.
///
/// This allows the agent KML pipeline to treat every
/// feature (point, polygon, route, tour, etc.) uniformly.
abstract class KmlFeature {
  /// Builds and returns a valid KML payload
  /// that can be sent to the Liquid Galaxy rig.
  KmlPayload build();
}
