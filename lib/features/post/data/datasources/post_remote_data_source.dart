
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/post_parameter.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPost({required PostParameter parameter});
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  ApiConsumer apiConsumer;

  PostRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<PostModel>> getPost({required PostParameter parameter}  ) async {
    print('parameter'+parameter.startIndex.toString());
    print('parameter'+parameter.limit.toString());
    final response = await apiConsumer.get(
      EndPoints.getPost,
      queryParameters:
        {'_start': parameter.startIndex, '_limit': parameter.limit},
    );
    // final userList = (response["data"] as List).map((e) => User.fromJson(e)).toList();
    return (response as List).map((e) => PostModel.fromJson(e)).toList();
    //return PostModel.fromJson(response);
  }
}