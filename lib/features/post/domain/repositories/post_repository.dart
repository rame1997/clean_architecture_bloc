import '../../../../core/error/Failure.dart';
import '../entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  //هان تفاصيل العقد
  Future<Either<Failure, List<Post>>> getPost({required PostParameter});
}