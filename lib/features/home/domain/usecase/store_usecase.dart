import 'package:oasis_salon_app/features/home/domain/repositories/store_repositories.dart';
import 'package:oasis_salon_app/models/store_models.dart';

class GetStores {
  final StoreRepository repository;
  GetStores(this.repository);

  Future<List<Store>> call() => repository.getStores();
}
