import 'package:flutter/material.dart';
import '../../widgets/action_card.dart';
import '../../lg/connection/lg_connection.dart';
import '../../kmls/pyramid_kml_model.dart';
import '../../kmls/logo_kml_model.dart';

class TaskActions
    extends
        StatelessWidget {
  final LGConnection? lg; // ✅ nullable now

  const TaskActions({
    super.key,
    this.lg,
  });

  bool get _connected =>
      lg !=
      null;

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
            subtitle: _connected
                ? "Show LG logo"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;

              final logoKml = kmllogo.generatekml();
              await lg!.sendLogo(
                3,
                logoKml,
              );
            },
          ),

          // 2️⃣ SHOW PYRAMID
          FamilyCard(
            icon: Icons.change_history,
            title: "Show Pyramid",
            subtitle: _connected
                ? "3D pyramid in Egypt"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;

              final payload = PyramidKmlModel.generate(
                latitude: 29.9792,
                longitude: 31.1342,
              );

              await lg!.showKml(
                'pyramid.kml',
                payload,
              );

              lg!.setCurrentTarget(
                lat: 29.9792,
                lon: 31.1342,
                zoom: 30000,
              );
            },
          ),

          // 3️⃣ FLY HOME
          FamilyCard(
            icon: Icons.home,
            title: "Fly Home",
            subtitle: _connected
                ? "Go to Delhi"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;

              await lg!.flyTo(
                lat: 28.6129,
                lon: 77.2295,
                range: 200000,
              );

              lg!.setCurrentTarget(
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
            subtitle: _connected
                ? "Remove logo overlay"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;
              await lg!.cleanLogo(
                3,
              );
            },
          ),

          // 5️⃣ CLEAN KML
          FamilyCard(
            icon: Icons.delete_sweep,
            title: "Clean KML",
            subtitle: _connected
                ? "Remove all KML"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;
              await lg!.cleanKmls();
            },
          ),

          // 🔄 ORBIT
          FamilyCard(
            icon: Icons.sync,
            title: "Orbit",
            subtitle: _connected
                ? "Start / Stop orbit"
                : "Connect first",
            onTap: () async {
              if (!_connected) return;

              if (lg!.currentLat ==
                      null ||
                  lg!.currentLon ==
                      null ||
                  lg!.currentZoom ==
                      null) {
                return;
              }

              await lg!.toggleOrbit(
                latitude: lg!.currentLat!,
                longitude: lg!.currentLon!,
                zoom: lg!.currentZoom!,
                tilt: 60,
              );
            },
          ),
        ],
      ),
    );
  }
}
