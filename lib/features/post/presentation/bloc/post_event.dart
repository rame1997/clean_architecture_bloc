part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
    PostsEvent();

  @override
  List<Object> get props => [];
}
 class GetPostsEvent extends PostEvent{
  @override
  PostsEvent() {
  }

 }