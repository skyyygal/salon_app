import 'package:oasis_salon_app/features/home/data/data_sources/store_datasource.dart';
import 'package:oasis_salon_app/features/home/domain/repositories/store_repositories.dart';
import 'package:oasis_salon_app/models/store_models.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreLocalDataSource localDataSource;

  StoreRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Store>> getStores() async {
    return await localDataSource.getStoresFromJson();
  }
}
