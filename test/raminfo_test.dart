import 'package:flutter_test/flutter_test.dart';
import 'package:raminfo/raminfo.dart';
import 'package:raminfo/raminfo_platform_interface.dart';
import 'package:raminfo/raminfo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRaminfoPlatform 
    with MockPlatformInterfaceMixin
    implements RaminfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RaminfoPlatform initialPlatform = RaminfoPlatform.instance;

  test('$MethodChannelRaminfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRaminfo>());
  });

  test('getPlatformVersion', () async {
    Raminfo raminfoPlugin = Raminfo();
    MockRaminfoPlatform fakePlatform = MockRaminfoPlatform();
    RaminfoPlatform.instance = fakePlatform;
  
    expect(await raminfoPlugin.getPlatformVersion(), '42');
  });
}
