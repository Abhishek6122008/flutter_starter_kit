// SKELETON: Simple demo screen that wires
// GeocodingApi → GeocodingPointKmlAdapter → LG sender
//
// This file is intentionally minimal and agent-friendly.

import 'package:flutter/material.dart';

import '../api/geocoding_api.dart';
import '../api/geocoding_point_kml_adapter.dart';
import '../lg/lg_kml_sender.dart';

class GeocodingDemoScreen
    extends
        StatefulWidget {
  final GeocodingApi geocodingApi;
  final LgKmlSender lgSender;

  const GeocodingDemoScreen({
    super.key,
    required this.geocodingApi,
    required this.lgSender,
  });

  @override
  State<
    GeocodingDemoScreen
  >
  createState() => _GeocodingDemoScreenState();
}

class _GeocodingDemoScreenState
    extends
        State<
          GeocodingDemoScreen
        > {
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<
    void
  >
  _run() async {
    final place = _controller.text.trim();
    if (place.isEmpty) return;

    setState(
      () => _loading = true,
    );

    try {
      final location = await widget.geocodingApi.getCoordinates(
        place,
      );

      final payload = GeocodingPointKmlAdapter.buildFromLocation(
        placeName: place,
        location: location,
      );

      await widget.lgSender.send(
        payload,
      );
    } finally {
      if (mounted) {
        setState(
          () => _loading = false,
        );
      }
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Geocoding → LG demo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Place name',
                hintText: 'e.g. Paris, France',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: _loading
                  ? null
                  : _run,
              child: _loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Send to Liquid Galaxy',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
