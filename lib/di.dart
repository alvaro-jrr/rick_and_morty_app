import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/db/database.dart';
import 'package:rick_and_morty_app/features/characters/data/data_source/character_local_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_cubit.dart';

/// The dependency injection instance.
final sl = GetIt.instance;

void init() {
  // Characters.
  sl.registerFactory(() => ApiCubit(sl()));

  sl.registerFactory<CharacterRepository>(() {
    return CharacterRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    );
  });

  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(database: sl()),
  );

  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(client: sl()),
  );

  // Database.
  sl.registerLazySingleton(() => AppDatabase());

  // External.
  sl.registerLazySingleton(() => http.Client());
}
