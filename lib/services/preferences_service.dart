import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final String _useDarkModeKey = 'useDarkMode';
  final String _favouritesKey = 'favourites';
  final SharedPreferences _sharedPreferences;

  PreferencesService(this._sharedPreferences);

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;

  List<String> get favourites =>
      _sharedPreferences.getStringList(_favouritesKey) ?? <String>[];

  set favourites(List<String> favourites) {
    _sharedPreferences.setStringList(_favouritesKey, favourites);
  }
}
