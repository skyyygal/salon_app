import 'package:oasis_salon_app/features/home/data/data_sources/models/store_models.dart';
import 'package:oasis_salon_app/features/home/domain/repositories/store_repositories.dart';

class GetStores {
  final StoreRepository repository;
  GetStores(this.repository);

  Future<List<StoreModel>> call() => repository.getStores();
}
