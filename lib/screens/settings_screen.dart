import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_mobx_app/stores/settings_store.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsStore store;

  const SettingsScreen(this.store, {Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: SwitchListTile(
              title: const Text('Dark mode'),
              subtitle: const Text(
                'Note: this won\'t affect the articles that are displayed',
              ),
              value: widget.store.useDarkMode!,
              onChanged: (bool value) {
                widget.store.setDarkMode(value);
              },
            ),
          ),
        ),
        ListTile(
          title: const Text('Privacy policy'),
          onTap: () async {
            await widget.store.showPrivacyPolicy();
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
