// cart_provider.dart
import 'dart:convert';

import 'package:flutter_riverpod/legacy.dart';
import 'package:oasis_salon_app/features/home/domain/entities/service_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartNotifier extends StateNotifier<List<Service>> {
  CartNotifier() : super([]) {
    _loadCart(); // load on startup
  }

  static const _cartKey = "cart_services";

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getStringList(_cartKey) ?? [];
    state = cartData
        .map((jsonStr) => Service.fromJson(json.decode(jsonStr)))
        .toList();
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = state.map((s) => json.encode(s.toJson())).toList();
    await prefs.setStringList(_cartKey, cartData);
  }

  void addService(Service service) {
    if (!state.any((s) => s.id == service.id)) {
      state = [...state, service];
      _saveCart();
    }
  }

  void removeService(Service service) {
    state = state.where((s) => s.id != service.id).toList();
    _saveCart();
  }

  void clearCart() {
    state = [];
    _saveCart();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Service>>((ref) {
  return CartNotifier();
});
