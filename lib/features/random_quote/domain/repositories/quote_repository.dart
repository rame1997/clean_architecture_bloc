import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../entities/quote.dart';

abstract class QuoteRepository {
  //هان تفاصيل العقد
  Future<Either<Failure, Quote>> getRandomQuote();
  Future<Either<Failure, Quote>> getConcreteQuote();
}