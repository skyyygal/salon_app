import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:oasis_salon_app/models/store_models.dart';

class StoreLocalDataSource {
  Future<List<Store>> getStoresFromJson() async {
    final jsonStr = await rootBundle.loadString('assets/data/stores.json');
    final data = json.decode(jsonStr);
    final stores = data['stores'] as List;
    return stores.map((e) => Store.fromJson(e)).toList();
  }
}
