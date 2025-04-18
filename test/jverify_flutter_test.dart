import 'package:flutter_test/flutter_test.dart';
import 'package:jverify_flutter/jverify_flutter.dart';
import 'package:jverify_flutter/jverify_flutter_platform_interface.dart';
import 'package:jverify_flutter/jverify_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJverifyFlutterPlatform
    with MockPlatformInterfaceMixin
    implements JverifyFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JverifyFlutterPlatform initialPlatform = JverifyFlutterPlatform.instance;

  test('$MethodChannelJverifyFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJverifyFlutter>());
  });

  test('getPlatformVersion', () async {
    JverifyFlutter jverifyFlutterPlugin = JverifyFlutter();
    MockJverifyFlutterPlatform fakePlatform = MockJverifyFlutterPlatform();
    JverifyFlutterPlatform.instance = fakePlatform;

    expect(await jverifyFlutterPlugin.getPlatformVersion(), '42');
  });
}
