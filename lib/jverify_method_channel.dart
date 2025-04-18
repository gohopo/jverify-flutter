import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jverify_platform_interface.dart';

/// An implementation of [JverifyPlatform] that uses method channels.
class MethodChannelJverify extends JverifyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jverify');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
