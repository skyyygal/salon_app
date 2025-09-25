import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oasis_salon_app/features/home/data/data_sources/store_datasource.dart';
import 'package:oasis_salon_app/features/home/data/store_repo_impl.dart';
import 'package:oasis_salon_app/features/home/domain/usecase/store_usecase.dart';
import 'package:oasis_salon_app/models/store_models.dart';

final homeStoreRepositoryProvider = Provider<StoreRepositoryImpl>((ref) {
  return StoreRepositoryImpl(localDataSource: StoreLocalDataSource());
});

final getStoresProvider = Provider<GetStores>((ref) {
  return GetStores(ref.read(homeStoreRepositoryProvider));
});

final storesProvider = FutureProvider<List<Store>>((ref) async {
  final usecase = ref.read(getStoresProvider);
  return usecase();
});
