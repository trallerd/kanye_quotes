import 'package:get_it/get_it.dart';
import 'package:kenye_app/data/repositories/quote_repository.dart';
import 'package:kenye_app/data/repositories/quote_repository_interface.dart';
import 'package:kenye_app/service/http_service.dart';

var getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => HttpService());

  getIt.registerLazySingleton<QuoteRepositoryInterface>(
      () => QuoteRepository(getIt.get<HttpService>()));
}
