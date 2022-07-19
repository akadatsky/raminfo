import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raminfo/raminfo_method_channel.dart';

void main() {
  MethodChannelRaminfo platform = MethodChannelRaminfo();
  const MethodChannel channel = MethodChannel('raminfo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
