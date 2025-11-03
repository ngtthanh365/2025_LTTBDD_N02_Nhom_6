// city_notifier.dart
import 'package:flutter/material.dart';

ValueNotifier<List<Map<String, dynamic>>> favoriteCities = ValueNotifier([]);

void addCity(Map<String, dynamic> city) {
  // Kiểm tra nếu city có name và chưa tồn tại thì thêm mới
  if (city['name'] != null &&
      !favoriteCities.value.any((c) => c['name'] == city['name'])) {
    favoriteCities.value = [...favoriteCities.value, city];
  }
}

void removeCity(String name) {
  favoriteCities.value =
      favoriteCities.value.where((c) => c['name'] != name).toList();
}
