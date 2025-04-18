
import 'jverify_flutter_platform_interface.dart';

class JverifyFlutter {
  Future<String?> getPlatformVersion() {
    return JverifyFlutterPlatform.instance.getPlatformVersion();
  }
}
