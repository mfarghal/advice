import 'features/advice/data/datasources/advice_remote_datasource.dart';
import 'features/advice/data/repository/advice_repository_impl.dart';
import 'features/advice/domain/repository/advice_repository.dart';
import 'features/advice/domain/usecases/advice_usecases.dart';
import 'features/advice/presentation/bloc/advice_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.I;

///
///
Future<void> init() async {
  // ! presentation layer

  sl.registerFactory(() => AdviceBloc(sl()));

  // ! domain layer
  sl.registerFactory(() => AdviceUseCases(sl()));

  // ! data layer
  sl.registerFactory<AdviceRepository>(() => AdviceRepositoryImpl(sl()));
  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImpl(sl()));

  // ! externs
  sl.registerFactory(() => http.Client());
}


// Factory = every time new/fresh instance of that class