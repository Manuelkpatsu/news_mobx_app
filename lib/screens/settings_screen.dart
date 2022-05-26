import 'package:flutter/material.dart';
import 'package:news_mobx_app/stores/settings_store.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsStore store;

  const SettingsScreen(this.store, {Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
