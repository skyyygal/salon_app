import 'package:oasis_salon_app/features/home/data/data_sources/models/store_models.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> getStores();
}
