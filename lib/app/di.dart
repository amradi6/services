import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:services/app/app_prefs.dart';
import 'package:services/data/data_source/remote_data_source.dart';
import 'package:services/data/network/app_api.dart';
import 'package:services/data/network/dio_factory.dart';
import 'package:services/data/network/network_info.dart';
import 'package:services/data/repository/repository_impl.dart';
import 'package:services/domain/repository/repository.dart';
import 'package:services/domain/usecase/login_usecase.dart';
import 'package:services/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker.instance),
  );

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance()),
  );

  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
