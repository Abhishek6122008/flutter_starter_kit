import 'package:flutter/material.dart';
import '../../screens/task_demo/family_card.dart';
import '../../lg/lg_connection.dart';
import '../../models/pyramid_kml_model.dart';
import '../../models/logo_kml_model.dart';

class TaskActions
    extends
        StatelessWidget {
  final LGConnection lg;

  const TaskActions({
    super.key,
    required this.lg,
  });

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

          // 2️⃣ SHOW PYRAMID
          FamilyCard(
            icon: Icons.change_history,
            title: "Show Pyramid",
            subtitle: "3D colored pyramid",
            onTap: () async {
              final payload = PyramidKmlModel.generate(
                latitude: 28.6129, // change if you want
                longitude: 77.2295,
              );

              await lg.showKml(
                'pyramid.kml',
                payload,
              );
            },
          ),

          // 3️⃣ FLY HOME
          FamilyCard(
            icon: Icons.home,
            title: "Fly Home",
            subtitle: "Go to home city",
            onTap: () async {
              await lg.flyTo(
                lat: 28.6129,
                lon: 77.2295,
                range: 200000,
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
          // 🔥 RAW KML TEST (AGENT PIPELINE)
          FamilyCard(
            icon: Icons.code,
            title: "Raw KML Test",
            subtitle: "Show raw placemark",
            onTap: () async {
              const rawKml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>Raw KML Test</name>

  <Placemark>
    <name>Agent Test Point</name>
    <Point>
      <coordinates>77.2295,28.6129,0</coordinates>
    </Point>
  </Placemark>

</Document>
</kml>''';

              await lg.showRawKml(
                fileName: 'raw_test.kml',
                kml: rawKml,
              );
            },
          ),
        ],
      ),
    );
  }
}
