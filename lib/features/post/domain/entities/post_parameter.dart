import 'package:equatable/equatable.dart';

class PostParameter extends Equatable{
  final int startIndex;
  final int limit;

  PostParameter([this.startIndex=0,  this.limit=20]);

  @override
  // TODO: implement props
  List<Object?> get props => [startIndex,limit];
}