import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/Failure.dart';
//type to what return Params for parameter
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}