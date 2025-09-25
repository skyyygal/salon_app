import 'package:oasis_salon_app/features/home/data/data_sources/models/store_models.dart';
import 'package:oasis_salon_app/features/home/data/data_sources/store_datasource.dart';
import 'package:oasis_salon_app/features/home/domain/repositories/store_repositories.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreLocalDataSource localDataSource;

  StoreRepositoryImpl({required this.localDataSource});

  @override
  Future<List<StoreModel>> getStores() async {
    return await localDataSource.getStoresFromJson();
  }
}
