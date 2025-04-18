import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jverify_method_channel.dart';

abstract class JverifyPlatform extends PlatformInterface {
  /// Constructs a JverifyPlatform.
  JverifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static JverifyPlatform _instance = MethodChannelJverify();

  /// The default instance of [JverifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelJverify].
  static JverifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JverifyPlatform] when
  /// they register themselves.
  static set instance(JverifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
