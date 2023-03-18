import 'package:get_it/get_it.dart';
import 'package:uran_company_test/core/blocs/exhibit_bloc.dart';
import 'package:uran_company_test/services/exhibits_cache_service.dart';
import 'package:uran_company_test/services/exhibits_loader.dart';
import 'package:uran_company_test/services/services_impl/exhibits_cache_impl.dart';
import 'package:uran_company_test/services/services_impl/rest_exhibits_loader.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ExhibitsCacheService>(ExhibitsCacheImpl());

  locator.registerSingleton<ExhibitsLoader>(RestExhibitsLoader());

  locator.registerSingleton(
    ExhibitBloc(
      exhibitsLoader: locator.get(),
      cache: locator.get(),
    ),
  );
}
