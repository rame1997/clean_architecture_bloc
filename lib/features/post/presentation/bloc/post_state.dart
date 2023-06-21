part of 'post_bloc.dart';
enum PostStatus { loading, success, error }

@immutable
 class PostState extends Equatable
{
  final PostStatus status;//check post status
  final List<Post> posts;
  final bool hasReachedMax;//when return empty list stop api call arrived to end list
  final String errorMessage;

   PostState(//constr
      {this.status = PostStatus.loading,
        this.hasReachedMax = false,
        this.posts = const [],
        this.errorMessage = ""});
//حيساعد لتعديل الحالة علي فرض كانت الحالة ناجحة وفيها بوست
// قديم هادي الميثود حتحفظ
// البوست القديمة ويعيد طلب البوست الجديدة فحيضيف القديمة مع الجديدة
  //اذا الحالة حتحتاج لتعديل قائمة البوست والماكس والباقي اختياري
//باختصار هادي لتحديث الحالة اذا كانت
  //زي ما هي خلص واذا تغييرت بتتغير الحالة وبيضيف الليست القديم علي الجديد
  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  List<Object> get props => [status,posts,hasReachedMax,errorMessage];

}
class PostError extends PostState {
  final String msg;

  PostError({required this.msg});

  @override
// TODO: implement props
  List<Object> get props => [];
}
// class PostInitial extends PostState {}
//
// class PostIsLodaing extends PostState {
//
// }
//
class PostIsLodaed extends PostState {
  final Post post;

   PostIsLodaed.PostLodaed({required this.post});

  @override
  // TODO: implement props
  List<Object> get props => [];
}


