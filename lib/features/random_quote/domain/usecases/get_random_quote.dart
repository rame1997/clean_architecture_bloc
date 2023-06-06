import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quote_repository.dart';
//تسجيل الدخول يعتبر يوسكيس تسيجل جديد يعتبر يوسكيس كل عملية تعتبر يو سكيس
//هان لا يلزم ادخل بارميتر لانوا التطبيق لا ياخذ بارميتر
class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
//لو في بارميتر
// class GetRandomQuote implements UseCase<Quote, loadParameter> {
//   final QuoteRepository quoteRepository;
//
//   GetRandomQuote({required this.quoteRepository});
//   @override
//   Future<Either<Failure, Quote>> call(loadParameter params) =>
//       quoteRepository.getRandomQuote(params.userName);
// }
// class loadParameter extends Equatable{
//   final String userName;
//   final String password;
//
//   loadParameter({required this.userName, required this.password});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [userName,password];
//}