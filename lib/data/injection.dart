import 'package:get_it/get_it.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/domain/api_client_imp.dart';

final getIt = GetIt.instance;

Future<void> getItInit() async {
  if (getIt.isRegistered(instance: LocalStorage())) {
    return;
  }

  getIt.registerSingleton<LocalStorage>(LocalStorage());
  await Future.delayed(const Duration(seconds: 1));
  getIt.registerSingleton<ApiClientImp>(ApiClientImp());
}
