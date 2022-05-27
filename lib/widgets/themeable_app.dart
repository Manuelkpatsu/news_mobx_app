import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../screens/favorites_screen.dart';
import '../screens/new_stories_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/top_stories_screen.dart';
import '../stores/favorites_store.dart';
import '../stores/new_stories_store.dart';
import '../stores/settings_store.dart';
import 'package:news_mobx_app/stores/top_stories_store.dart';

class ThemeableApp extends StatelessWidget {
  final SettingsStore settingsStore;

  const ThemeableApp(this.settingsStore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final themeData = ThemeData(
          fontFamily: 'Lato',
          brightness: settingsStore.useDarkMode == true
              ? Brightness.dark
              : Brightness.light,
          primarySwatch: Colors.teal,
          textTheme: const TextTheme(
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            subtitle2: TextStyle(fontWeight: FontWeight.w300),
          ),
        );

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: SafeArea(
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.new_releases),
                    label: 'New',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up),
                    label: 'Top',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favourites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return Consumer<NewStoriesStore>(
                      builder: ((_, value, __) => Material(
                            child: NewStoriesScreen(value),
                          )),
                    );
                  case 1:
                    return Consumer<TopStoriesStore>(
                      builder: ((_, value, __) => Material(
                            child: TopStoriesScreen(value),
                          )),
                    );
                  case 2:
                    return Consumer<FavoritesStore>(
                      builder: (_, value, __) => Material(
                        child: FavoritesScreen(value),
                      ),
                    );
                  case 3:
                    return Consumer<SettingsStore>(
                      builder: (_, value, __) => Material(
                        child: SettingsScreen(value),
                      ),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
