import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repositories/quote_repository.dart';

class GetConcreteQuote implements UseCase<Quote, loginParameter> {
  final QuoteRepository quoteRepository;

  GetConcreteQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(loginParameter params) =>
      quoteRepository.getConcreteQuote();
}

class loginParameter extends Equatable{
  final String userName;
  final String password;

  loginParameter({required this.userName, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [userName,password];
}