import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:w6_app/data/repositories/app_settings_repository.dart';

import 'main_common.dart';

import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';

import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    // ChangeNotifierProvider<AppSettingsState>(create: (_) => AppSettingsState()),

    Provider<AppSettingsRepository>(create: (_) => MockAppSettingsRepository()),
    
    ChangeNotifierProvider<AppSettingsState>(
      create: (context) {
        final repo = context.read<AppSettingsRepository>();
        final state = AppSettingsState(repo);
        state.init();
        return state;
      },
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
