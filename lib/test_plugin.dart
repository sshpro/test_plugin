
import 'test_plugin_platform_interface.dart';

class TestPlugin {
  Future<String?> getPlatformVersion() {
    return TestPluginPlatform.instance.getPlatformVersion();
  }
  Future<void> log(String log) {
     return TestPluginPlatform.instance.log(log);
  }
}
