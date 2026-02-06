import 'package:flutter/material.dart';
import '../../widgets/gradient_background.dart';
import '../../lg/connection/lg_connection.dart';
import 'lg_actions_panels.dart';
import '../assistant/gemini_assistant_button.dart';
import '../../api/geocoding_api.dart';
import '../../kmls/point_kml_builder.dart';
import '../../kmls/common_kml.dart';
import 'package:flutter_starter_kit/presentation/connection/connection_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen
    extends
        StatefulWidget {
  final LGConnection? lg;

  const HomeScreen({
    super.key,
    this.lg,
  });

  @override
  State<
    HomeScreen
  >
  createState() => _HomeScreen();
}

class _HomeScreen
    extends
        State<
          HomeScreen
        > {
  final TextEditingController placeController = TextEditingController();

  final GeocodingApi geoApi = OpenCageGeocodingApi(
    dotenv.env['OPENCAGE_API_KEY']!,
  );

  LGConnection? _lg; // ✅ added

  bool loading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _lg = widget.lg; // ✅ added
  }

  Future<
    void
  >
  _showPlace() async {
    if (_lg ==
        null) {
      setState(
        () {
          error = "Please connect to Liquid Galaxy first.";
        },
      );
      return;
    }

    final place = placeController.text.trim();
    if (place.isEmpty) return;

    setState(
      () {
        loading = true;
        error = null;
      },
    );

    try {
      final point = await geoApi.getCoordinates(
        place,
      );

      final placemark = PointKmlBuilder.build(
        latitude: point.lat,
        longitude: point.lng,
        name: place,
      );

      final kmlString =
          '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    $placemark
  </Document>
</kml>
''';

      final payload = KmlPayload(
        kml: kmlString,
        latitude: point.lat,
        longitude: point.lng,
        range: 50000,
      );

      await _lg!.showKml(
        'place.kml',
        payload,
      );

      await _lg!.flyTo(
        lat: point.lat,
        lon: point.lng,
        range: 50000,
      );
    } catch (
      e
    ) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(
      () {
        loading = false;
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      floatingActionButton: const GeminiAssistantButton(),
      body: GradientBackground(
        child: DefaultTextStyle.merge(
          style: const TextStyle(
            decoration: TextDecoration.none,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Liquid Galaxy Flutter Starter",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (
                                  _,
                                ) => const ConnectionScreen(),
                          ),
                        );

                        if (result
                            is LGConnection) {
                          setState(
                            () {
                              _lg = result; // ✅ update connection
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Agentic Flutter Starter Kit",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: placeController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Enter a place (for example: Eiffel Tower)",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white24,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: loading
                          ? null
                          : _showPlace,
                      child: loading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Show",
                            ),
                    ),
                  ],
                ),
              ),

              if (error !=
                  null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    error!,
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),

              const SizedBox(
                height: 20,
              ),

              TaskActions(
                lg: _lg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
