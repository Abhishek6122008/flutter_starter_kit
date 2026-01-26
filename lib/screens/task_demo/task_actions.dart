import 'package:flutter/material.dart';
import '../../screens/task_demo/family_card.dart';
import '../../lg/lg_connection.dart';
import '../../models/pyramid_kml_model.dart';
import '../../models/logo_kml_model.dart';
import '../../api/opensky_flights.dart';
import '../../api/utils/flight_kml_builder.dart';
import '../../models/delhi_london_kml.dart';

class TaskActions
    extends
        StatelessWidget {
  final LGConnection lg;

  const TaskActions({
    super.key,
    required this.lg,
  });

  // ✈️ LIVE FLIGHTS FUNCTION
  Future<
    void
  >
  _showFlights() async {
    final flights = await OpenSkyFlights.getFlights(
      lamin: 6.0,
      lamax: 36.0,
      lomin: 68.0,
      lomax: 98.0,
    );

    final kml = FlightKmlBuilder.buildFlightsKml(
      flights,
    );

    await lg.showRawKml(
      fileName: "flights.kml",
      kml: kml,
    );

    // Fly camera to India center
    await lg.flyTo(
      lat: 22.0,
      lon: 78.0,
      range: 4000000,
    );

    // 🔑 Set orbit target to India
    lg.setCurrentTarget(
      lat: 22.0,
      lon: 78.0,
      zoom: 4000000,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      flex: 3,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        children: [
          // 1️⃣ SEND LOGO
          FamilyCard(
            icon: Icons.layers,
            title: "Send Logo",
            subtitle: "Show LG logo",
            onTap: () async {
              final logoKml = kmllogo.generatekml();
              await lg.sendLogo(
                3,
                logoKml,
              );
            },
          ),
          FamilyCard(
            icon: Icons.flight_takeoff,
            title: "Delhi → London",
            subtitle: "Markers + Route + Pyramids",
            onTap: () async {
              final payload = DelhiLondonKmlModel.generate();

              await lg.showKml(
                "delhi_london.kml",
                payload,
              );

              // Fly to Delhi and set orbit target
              await lg.flyTo(
                lat: 28.5562,
                lon: 77.1000,
                range: 30000,
              );
            },
          ),

          // 2️⃣ SHOW PYRAMID (EGYPT 🔥)
          FamilyCard(
            icon: Icons.change_history,
            title: "Show Pyramid",
            subtitle: "3D pyramid in Egypt",
            onTap: () async {
              final payload = PyramidKmlModel.generate(
                latitude: 29.9792,
                longitude: 31.1342,
              );

              await lg.showKml(
                'pyramid.kml',
                payload,
              );

              // 🔑 Set orbit target
              lg.setCurrentTarget(
                lat: 29.9792,
                lon: 31.1342,
                zoom: 30000,
              );
            },
          ),

          // 3️⃣ FLY HOME (DELHI)
          FamilyCard(
            icon: Icons.home,
            title: "Fly Home",
            subtitle: "Go to Delhi",
            onTap: () async {
              await lg.flyTo(
                lat: 28.6129,
                lon: 77.2295,
                range: 200000,
              );

              // 🔑 Set orbit target
              lg.setCurrentTarget(
                lat: 28.6129,
                lon: 77.2295,
                zoom: 200000,
              );
            },
          ),

          // 4️⃣ CLEAN LOGO
          FamilyCard(
            icon: Icons.delete_forever,
            title: "Clean Logo",
            subtitle: "Remove logo overlay",
            onTap: () async {
              await lg.cleanLogo(
                3,
              );
            },
          ),

          // 5️⃣ CLEAN KML
          FamilyCard(
            icon: Icons.delete_sweep,
            title: "Clean KML",
            subtitle: "Remove all KML",
            onTap: () async {
              await lg.cleanKmls();
            },
          ),

          // 🔄 ORBIT TOGGLE (🔥 MAIN FEATURE)
          FamilyCard(
            icon: Icons.sync,
            title: "Orbit",
            subtitle: "Start / Stop orbit",
            onTap: () async {
              if (lg.currentLat ==
                      null ||
                  lg.currentLon ==
                      null ||
                  lg.currentZoom ==
                      null) {
                return;
              }

              await lg.toggleOrbit(
                latitude: lg.currentLat!,
                longitude: lg.currentLon!,
                zoom: lg.currentZoom!,
                tilt: 60,
              );
            },
          ),

          // ✈️ LIVE FLIGHTS DEMO 🔥🔥🔥
          FamilyCard(
            icon: Icons.flight,
            title: "Live Flights",
            subtitle: "Show planes over India",
            onTap: () async {
              await _showFlights();
            },
          ),
        ],
      ),
    );
  }
}
