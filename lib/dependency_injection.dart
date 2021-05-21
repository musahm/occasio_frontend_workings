import 'package:get_it/get_it.dart';
import 'package:occasio_frontend_workings/features/dashboard/data/datasources/remote_data_source.dart';
import 'package:occasio_frontend_workings/features/dashboard/data/repositories/repositoryImpl.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/usecases/get_matches_usecase.dart';
import 'package:occasio_frontend_workings/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void setup() {
  //bloc
  sl.registerFactory(() => DashboardBloc(getMatchesUseCase: sl()));

  // usecase
  sl.registerLazySingleton(() => GetMatchesUseCase(sl<RepositoryImpl>()));

  // repo
  sl.registerLazySingleton(
      () => RepositoryImpl(remoteDataSourceImpl: sl<RemoteDataSourceImpl>()));

  // Datasource
  sl.registerLazySingleton(
      () => RemoteDataSourceImpl(client: sl<http.Client>()));

  // External

  sl.registerLazySingleton(() => http.Client());
}
