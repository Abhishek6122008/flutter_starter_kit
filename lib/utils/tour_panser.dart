import 'package:xml/xml.dart';

class TourStop {
  final String name;
  final double duration;

  TourStop({
    required this.name,
    required this.duration,
  });
}

class TourParser {
  static List<
    TourStop
  >
  parse(
    String kml,
  ) {
    final document = XmlDocument.parse(
      kml,
    );
    final placemarks = document.findAllElements(
      'Placemark',
    );

    final List<
      TourStop
    >
    stops = [];

    for (var placemark in placemarks) {
      final name = placemark
          .findElements(
            'name',
          )
          .first
          .text;

      // Default wait time
      double duration = 5;

      final waits = document.findAllElements(
        'gx:Wait',
      );
      if (waits.isNotEmpty) {
        final d = waits.first
            .findElements(
              'gx:duration',
            )
            .first
            .text;
        duration =
            double.tryParse(
              d,
            ) ??
            5;
      }

      stops.add(
        TourStop(
          name: name,
          duration: duration,
        ),
      );
    }

    return stops;
  }
}
