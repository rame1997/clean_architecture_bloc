import 'package:clean_art_project/features/post/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/netwok/netwok_info.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';
//هان اذا مرتبط بالشبكة حيجيب الداد من الانترنت لا من الكاش القديم
//هان يتم عمل اميبليمنت للميثود الموجدة في الdomin
//تقريبا هان الكونترولر تبع الgetx سابقا
class PostRepositoryImpl implements PostRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl(
      {required this.networkInfo,
        required this.postRemoteDataSource,
        });


  @override
  Future<Either<Failure, List<Post>>> getPost({required PostParameter}) async {
    try {
      final remotePost =
          await postRemoteDataSource.getPost(parameter: PostParameter);
    //  randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
      return Right(remotePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }




}