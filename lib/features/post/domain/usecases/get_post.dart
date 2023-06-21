import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post.dart';
import '../entities/post_parameter.dart';
import '../repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPost implements UseCase<List<Post>, PostParameter> {
  final PostRepository postRepository;

  GetPost({required this.postRepository});
  @override
  Future<Either<Failure,List<Post>>> call(PostParameter params) =>
      postRepository.getPost(PostParameter: params);
}