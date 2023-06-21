import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/netwok/netwok_info.dart';
import 'package:dio/dio.dart';
import 'features/post/injection_container.dart';
import 'features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'features/random_quote/data/repositories/quote_repository_impl.dart';
import 'features/random_quote/domain/repositories/quote_repository.dart';
import 'features/random_quote/domain/usecases/get_random_quote.dart';
import 'features/random_quote/injection_container.dart';
import 'features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/splash/data/datasources/lang_local_data_source.dart';
import 'features/splash/injection_container.dart';
final sl = GetIt.instance;

Future<void> init() async {
  //هادي علي مستوي التطبيق كل الاشياء المشتركة
  //باختصار الكوبيت كانت بتحتاج الي usecases وهادا يحتاج الي ريبو  وهادا يحتاج الي الداد سورس وهادا يحتاج الي http وكل هادا يكون داخل السيرفر لوكيتور بيجمع كل هدول
  //كل حاجة تستخدم في المشروع كديبنتنسي لازم تكون هان
  //بتحط الbloc والusecase والباقي
  //نحتفظ بسجل مركزي يوفر من مكان واحد
  initRandomQute();
  initSplashQute();
  initGetPost();
  //! Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => AppIntercepters());
   //هادا لطباعة اللوج
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
