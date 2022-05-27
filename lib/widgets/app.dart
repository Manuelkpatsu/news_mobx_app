import 'package:flutter/material.dart';
import 'package:news_mobx_app/services/preferences_service.dart';
import 'package:news_mobx_app/stores/new_stories_store.dart';
import 'package:news_mobx_app/stores/top_stories_store.dart';
import 'package:provider/provider.dart';

import '../repository/client.dart';
import '../services/sharing_service.dart';
import '../services/story_service.dart';
import '../stores/favorites_store.dart';
import '../stores/settings_store.dart';
import 'themeable_app.dart';

class App extends StatelessWidget {
  final PreferencesService _preferencesService;

  const App(this._preferencesService, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesService>(
          create: (_) => _preferencesService,
        ),
        Provider<HnpwaClient>(
          create: (_) => HnpwaClient(),
        ),
        Provider<SettingsStore>(
          create: (_) => SettingsStore(_preferencesService),
        ),
        Provider<FavoritesStore>(
          create: (_) => FavoritesStore(_preferencesService),
        ),
        Provider<SharingService>(
          create: (_) => SharingService(),
        ),
        Provider<StoryService>(
          create: (_) => StoryService(),
        ),
        ProxyProvider<HnpwaClient, NewStoriesStore>(
          update: (_, hnpwaClient, __) => NewStoriesStore(hnpwaClient),
        ),
        ProxyProvider<HnpwaClient, TopStoriesStore>(
          update: (_, hnpwaClient, __) => TopStoriesStore(hnpwaClient),
        ),
      ],
      child: Consumer<SettingsStore>(
        builder: (context, value, _) => ThemeableApp(value),
      ),
    );
  }
}
