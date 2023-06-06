import 'package:clean_art_project/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/netwok/netwok_info.dart';
import 'data/datasources/random_quote_local_data_source.dart';
import 'data/datasources/random_quote_remote_data_source.dart';
import 'data/repositories/quote_repository_impl.dart';
import 'domain/repositories/quote_repository.dart';
import 'domain/usecases/get_random_quote.dart';
final sl = GetIt.instance;

Future<void> initRandomQute() async {
  //هادي الخاصة بالفيتشر الحالية
  //باختصار الكوبيت كانت بتحتاج الي usecases وهادا يحتاج الي ريبو  وهادا يحتاج الي الداد سورس وهادا يحتاج الي http وكل هادا يكون داخل السيرفر لوكيتور بيجمع كل هدول
  //كل حاجة تستخدم في المشروع كديبنتنسي لازم تكون هان
  //بتحط الbloc والusecase والباقي
  //! Features
  // Blocs
  //هان يتم عمل انستنس كسنقلتون وهادا يتحيلي اياه الgetit
  sl.registerFactory<RandomQuoteCubit>(
          () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetRandomQuote>(
          () => GetRandomQuote(quoteRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
          () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
          () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));


}
