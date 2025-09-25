import 'package:oasis_salon_app/models/store_models.dart';

abstract class StoreRepository {
  Future<List<Store>> getStores();
}
