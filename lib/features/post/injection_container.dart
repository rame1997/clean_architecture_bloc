import 'package:clean_art_project/features/post/domain/usecases/get_post.dart';
import 'package:clean_art_project/features/post/presentation/bloc/post_bloc.dart';
import 'package:clean_art_project/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/post_remote_data_source.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/repositories/post_repository.dart';


final sl = GetIt.instance;

Future<void> initGetPost() async {
  //هادي الخاصة بالفيتشر الحالية
  //باختصار الكوبيت كانت بتحتاج الي usecases وهادا يحتاج الي ريبو  وهادا يحتاج الي الداد سورس وهادا يحتاج الي http وكل هادا يكون داخل السيرفر لوكيتور بيجمع كل هدول
  //كل حاجة تستخدم في المشروع كديبنتنسي لازم تكون هان
  //بتحط الbloc والusecase والباقي
  //! Features
  // Blocs
  //هان يتم عمل انستنس كسنقلتون وهادا يتحيلي اياه الgetit
  sl.registerFactory<PostBloc>(
          () => PostBloc(getPostUseCase: sl()));


  // Use cases
  sl.registerLazySingleton<GetPost>(
          () => GetPost(postRepository: sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      networkInfo: sl(),
      postRemoteDataSource: sl(),
  ));

  // Data Sources

  sl.registerLazySingleton<PostRemoteDataSource>(
          () => PostRemoteDataSourceImpl(apiConsumer: sl()));


}
