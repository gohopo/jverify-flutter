import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jverify_flutter_method_channel.dart';

abstract class JverifyFlutterPlatform extends PlatformInterface {
  /// Constructs a JverifyFlutterPlatform.
  JverifyFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static JverifyFlutterPlatform _instance = MethodChannelJverifyFlutter();

  /// The default instance of [JverifyFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelJverifyFlutter].
  static JverifyFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JverifyFlutterPlatform] when
  /// they register themselves.
  static set instance(JverifyFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
