import 'package:top_notch_v2/LocalRepo.dart';
import'package:get_it/get_it.dart';


final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<LocalRepo>(() => LocalRepo());
}
