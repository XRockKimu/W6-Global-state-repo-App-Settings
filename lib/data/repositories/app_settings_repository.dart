import '../../model/settings/app_settings.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}

class MockAppSettingsRepository implements AppSettingsRepository {
  AppSettings _settings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    return _settings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    _settings = settings;
  }
}
