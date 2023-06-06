import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}
//لو حصل اكسيبشن من السيرفر الapi
class ServerFailure extends Failure {}
//لو حصل اكسيبشن من الكاش
class CacheFailure extends Failure {}