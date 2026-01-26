import 'dart:convert';
import 'dart:async';
import 'package:dartssh2/dartssh2.dart';
import '../models/common_kml.dart';

/// Holds LG connection configuration
class LGConfig {
  final String ip;
  final int port;
  final String username;
  final String password;

  LGConfig({
    required this.ip,
    required this.port,
    required this.username,
    required this.password,
  });
}

/// Main Liquid Galaxy connection and control class
class LGConnection {
  SSHClient? _client;
  final LGConfig config;

  Timer? _orbitTimer;
  bool _orbitPlaying = false;
  String? _lastOrbitPosition;

  bool _isConnected = false;

  // 🔑 Current orbit target (used by UI)
  double? currentLat;
  double? currentLon;
  double? currentZoom;

  static const String _baseUrl = 'http://lg1:81';
  static const String _kmlDir = '/var/www/html';
  static const String _kmlList = '/var/www/html/kmls.txt';
  static const String _slaveKmlDir = '/var/www/html/kml';

  LGConnection(
    this.config,
  );

  bool get isConnected => _isConnected;
  bool get isOrbitPlaying => _orbitPlaying;

  // ---------------- CONNECTION ----------------

  Future<
    bool
  >
  connect() async {
    try {
      final socket = await SSHSocket.connect(
        config.ip,
        config.port,
        timeout: const Duration(
          seconds: 5,
        ),
      );

      _client = SSHClient(
        socket,
        username: config.username,
        onPasswordRequest: () => config.password,
      );

      _isConnected = true;
      return true;
    } catch (
      e
    ) {
      _isConnected = false;
      return false;
    }
  }

  Future<
    void
  >
  disconnect() async {
    _client?.close();
    _client = null;
    _isConnected = false;
  }

  // ---------------- CORE EXEC ----------------

  Future<
    void
  >
  _exec(
    String command,
  ) async {
    if (_client ==
        null) {
      final ok = await connect();
      if (!ok) {
        throw Exception(
          'LG not connected',
        );
      }
    }
    await _client!.execute(
      command,
    );
  }

  Future<
    void
  >
  refresh() async {
    await _exec(
      "echo 'refresh=true' > /tmp/query.txt",
    );
  }

  // ---------------- TARGET MEMORY ----------------

  void setCurrentTarget({
    required double lat,
    required double lon,
    required double zoom,
  }) {
    currentLat = lat;
    currentLon = lon;
    currentZoom = zoom;
  }

  // ---------------- KML CONTROL ----------------

  /// Clears all loaded KMLs (manual use only)
  Future<
    void
  >
  cleanKmls() async {
    await _exec(
      "echo '' > $_kmlList",
    );
    await refresh();
  }

  /// Upload + APPEND KML safely (no overwrite bug 🔥)
  Future<
    void
  >
  sendKml(
    String fileName,
    String kmlContent,
  ) async {
    final encoded = base64Encode(
      utf8.encode(
        kmlContent,
      ),
    );

    await _exec(
      "echo '$encoded' | base64 -d > $_kmlDir/$fileName",
    );
    await _exec(
      "echo '\n$_baseUrl/$fileName' >> $_kmlList",
    );

    await refresh();
  }

  /// Show structured KML payload
  Future<
    void
  >
  showKml(
    String fileName,
    KmlPayload payload,
  ) async {
    await sendKml(
      fileName,
      payload.kml,
    );

    await flyTo(
      lat: payload.latitude,
      lon: payload.longitude,
      range: payload.range,
    );
  }

  // ---------------- RAW KML (API / AGENT SUPPORT) ----------------

  Future<
    void
  >
  showRawKml({
    required String fileName,
    required String kml,
  }) async {
    final encoded = base64Encode(
      utf8.encode(
        kml,
      ),
    );

    await _exec(
      "echo '$encoded' | base64 -d > $_kmlDir/$fileName",
    );
    await _exec(
      "echo '\n$_baseUrl/$fileName' >> $_kmlList",
    );

    await refresh();
  }

  // ---------------- LOGO CONTROL ----------------

  Future<
    void
  >
  sendLogo(
    int screen,
    String kmlContent,
  ) async {
    await _exec(
      "echo '$kmlContent' > $_slaveKmlDir/slave_$screen.kml",
    );
    await refresh();
  }

  Future<
    void
  >
  cleanLogo(
    int screen,
  ) async {
    const emptyKml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document></Document>
</kml>''';

    await _exec(
      "echo '$emptyKml' > $_slaveKmlDir/slave_$screen.kml",
    );
    await refresh();
  }

  // ---------------- CAMERA CONTROL ----------------

  Future<
    void
  >
  flyTo({
    required double lat,
    required double lon,
    required double range,
  }) async {
    final lookAt =
        '<LookAt>'
        '<latitude>$lat</latitude>'
        '<longitude>$lon</longitude>'
        '<range>$range</range>'
        '<heading>0</heading>'
        '<tilt>0</tilt>'
        '</LookAt>';

    await _exec(
      "echo \"flytoview=$lookAt\" > /tmp/query.txt",
    );

    // Save target for orbit
    setCurrentTarget(
      lat: lat,
      lon: lon,
      zoom: range,
    );
  }

  // ---------------- KEYBOARD MOVEMENTS ----------------

  Future<
    void
  >
  moveUp() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown Up",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup Up",
    );
  }

  Future<
    void
  >
  moveDown() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown Down",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup Down",
    );
  }

  Future<
    void
  >
  moveRight() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown Right",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup Right",
    );
  }

  Future<
    void
  >
  moveLeft() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown Left",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup Left",
    );
  }

  Future<
    void
  >
  rotateLeft() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown ctrl+Left",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup ctrl+Left",
    );
  }

  Future<
    void
  >
  rotateRight() async {
    await _exec(
      "export DISPLAY=:0; xdotool keydown ctrl+Right",
    );
    await Future.delayed(
      const Duration(
        milliseconds: 400,
      ),
    );
    await _exec(
      "export DISPLAY=:0; xdotool keyup ctrl+Right",
    );
  }

  // ---------------- ORBIT SYSTEM ----------------

  /// UI toggle: one button start / stop
  Future<
    void
  >
  toggleOrbit({
    required double latitude,
    required double longitude,
    required double zoom,
    required double tilt,
  }) async {
    if (_orbitPlaying) {
      await orbitStop();
    } else {
      await orbitPlay(
        latitude,
        longitude,
        zoom,
        tilt,
      );
    }
  }

  String orbitLookAtLinear(
    double latitude,
    double longitude,
    double zoom,
    double tilt,
    double bearing,
  ) {
    final lookAt =
        '<gx:duration>0.4</gx:duration>'
        '<gx:flyToMode>smooth</gx:flyToMode>'
        '<LookAt>'
        '<longitude>$longitude</longitude>'
        '<latitude>$latitude</latitude>'
        '<range>$zoom</range>'
        '<tilt>$tilt</tilt>'
        '<heading>$bearing</heading>'
        '<altitudeMode>relativeToGround</altitudeMode>'
        '</LookAt>';

    _lastOrbitPosition = lookAt;
    return lookAt;
  }

  Future<
    void
  >
  flyToOrbit(
    double latitude,
    double longitude,
    double zoom,
    double tilt,
    double bearing,
  ) async {
    final lookAt = orbitLookAtLinear(
      latitude,
      longitude,
      zoom,
      tilt,
      bearing,
    );

    await _exec(
      "echo 'flytoview=$lookAt' > /tmp/query.txt",
    );
  }

  Future<
    bool
  >
  orbitPlay(
    double latitude,
    double longitude,
    double zoom,
    double tilt,
  ) async {
    if (_orbitPlaying) return false;

    _orbitPlaying = true;

    const int steps = 90; // smooth circle
    const int stepDurationMs = 250;
    int currentStep = 0;
    bool isMoving = false;

    _orbitTimer = Timer.periodic(
      const Duration(
        milliseconds: stepDurationMs,
      ),
      (
        timer,
      ) {
        if (!_orbitPlaying ||
            currentStep >=
                steps) {
          timer.cancel();
          _orbitPlaying = false;
          return;
        }

        if (isMoving) return;

        isMoving = true;
        final double bearing =
            (currentStep *
                (360 /
                    steps)) %
            360;

        flyToOrbit(
          latitude,
          longitude,
          zoom,
          tilt,
          bearing,
        ).whenComplete(
          () {
            isMoving = false;
          },
        );

        currentStep++;
      },
    );

    return true;
  }

  Future<
    void
  >
  orbitStop() async {
    _orbitTimer?.cancel();
    _orbitTimer = null;
    _orbitPlaying = false;

    // Return camera to last stable position
    if (_lastOrbitPosition !=
        null) {
      await _exec(
        "echo 'flytoview=$_lastOrbitPosition' > /tmp/query.txt",
      );
    }
  }
}
