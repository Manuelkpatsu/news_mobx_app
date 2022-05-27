import 'package:mobx/mobx.dart';
import 'package:news_mobx_app/services/preferences_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final PreferencesService _preferencesService;

  @observable
  bool? useDarkMode;

  /// when the store is created, we read in the current settings immediately to avoid the scenario where
  /// the values displayed will change upon switching to the settings tab
  _SettingsStore(this._preferencesService) {
    useDarkMode = _preferencesService.useDarkMode;
  }

  @action
  void setDarkMode(bool updatedDarkModePreference) {
    _preferencesService.useDarkMode = updatedDarkModePreference;
    useDarkMode = updatedDarkModePreference;
  }

  Future<void> showPrivacyPolicy() async {
    final uri = Uri.parse('https://manuel-ahuno.firebaseapp.com/');

    canLaunchUrl(uri).then((bool result) {
      if (result == true) {
        return launchUrl(uri);
      } else {
        throw Exception(
            'Could not open https://crossingthestreams.io/supnews-privacy-policy/');
      }
    });
  }
}
