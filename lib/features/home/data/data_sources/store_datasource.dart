import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:oasis_salon_app/features/home/data/data_sources/models/store_models.dart';

class StoreLocalDataSource {
  Future<List<StoreModel>> getStoresFromJson() async {
    final jsonStr = await rootBundle.loadString('assets/stores.json');
    final data = json.decode(jsonStr);
    final stores = data['stores'] as List;
    return stores.map((e) => StoreModel.fromJson(e)).toList();
  }
}
