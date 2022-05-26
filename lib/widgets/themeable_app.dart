import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_mobx_app/repository/client.dart';
import 'package:provider/provider.dart';

import '../screens/favorites_screen.dart';
import '../screens/new_stories_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/top_stories_screen.dart';
import '../stores/favorites_store.dart';
import '../stores/new_stories_store.dart';
import '../stores/settings_store.dart';
import '../stores/top_stories_store.dart';

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
                    return ProxyProvider<HnpwaClient, NewStoriesStore>(
                      update: (_, hnpwaClient, __) =>
                          NewStoriesStore(hnpwaClient),
                      child: Consumer<NewStoriesStore>(
                        builder: ((context, value, _) => Material(
                              child: NewStoriesScreen(value),
                            )),
                      ),
                    );
                  case 1:
                    return ProxyProvider<HnpwaClient, TopStoriesStore>(
                      update: (_, hnpwaClient, __) =>
                          TopStoriesStore(hnpwaClient),
                      child: Consumer<TopStoriesStore>(
                        builder: ((context, value, _) => Material(
                              child: TopStoriesScreen(value),
                            )),
                      ),
                    );
                  case 2:
                    return Consumer<FavoritesStore>(
                      builder: (context, value, _) => Material(
                        child: FavoritesScreen(value),
                      ),
                    );
                  case 3:
                    return Consumer<SettingsStore>(
                      builder: (context, value, _) => Material(
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
