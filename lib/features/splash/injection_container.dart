import 'package:clean_art_project/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_art_project/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/lang_local_data_source.dart';
import 'data/repositories/lang_repository_impl.dart';
import 'domain/repositories/lang_repository.dart';
import 'domain/usecases/change_lang.dart';
import 'domain/usecases/get_saved_lang.dart';
final sl = GetIt.instance;

Future<void> initSplashQute() async {
//bloc
  sl.registerFactory<LocaleCubit>(
          () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetSavedLangUseCase>(
          () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
          () => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<LangRepository>(
          () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<LangLocalDataSource>(
          () => LangLocalDataSourceImpl(sharedPreferences: sl()));


}
