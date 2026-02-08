import 'lg_kml_sender.dart';
import '../kmls/common_kml.dart';

class DummyLgKmlSender
    implements
        LgKmlSender {
  @override
  Future<
    void
  >
  send(
    KmlPayload payload,
  ) async {
    print(
      '--- Dummy LG Sender ---',
    );
    print(
      payload.kml,
    );
    print(
      'Camera: lat=${payload.latitude}, lon=${payload.longitude}, range=${payload.range}',
    );
  }
}
