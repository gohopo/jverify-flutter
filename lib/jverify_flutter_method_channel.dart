import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jverify_flutter_platform_interface.dart';

/// An implementation of [JverifyFlutterPlatform] that uses method channels.
class MethodChannelJverifyFlutter extends JverifyFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jverify_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
