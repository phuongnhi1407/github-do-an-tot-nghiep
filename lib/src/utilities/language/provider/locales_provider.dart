import 'package:flutter/material.dart';

class LocaLesProvider extends ChangeNotifier {
  // scope private
  late String _locales;
  get locales => _locales;
  setLocales(value) {
    _locales = value;
    notifyListeners();
  }
}
