import 'package:flutter/material.dart';

class LocaLesProvider extends ChangeNotifier {
  late String _locales;
  get locales => _locales;
  setLocales(value) {
    _locales = value;

    notifyListeners();
  }
}
