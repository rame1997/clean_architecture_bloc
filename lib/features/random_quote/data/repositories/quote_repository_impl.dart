import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/netwok/netwok_info.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';
import '../datasources/random_quote_local_data_source.dart';
import '../datasources/random_quote_remote_data_source.dart';
//هان اذا مرتبط بالشبكة حيجيب الداد من الانترنت لا من الكاش القديم
//هان يتم عمل اميبليمنت للميثود الموجدة في الdomin
//تقريبا هان الكونترولر تبع الgetx سابقا
class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
        required this.randomQuoteRemoteDataSource,
        required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteRandomQuote =
      await randomQuoteRemoteDataSource.getRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
      return Right(remoteRandomQuote);
    } on ServerException {
      return Left(ServerFailure());
    }
  //}
  // else {
  //   try {
  //     final cacheRandomQuote =
  //         await randomQuoteLocalDataSource.getLastRandomQuote();
  //     return Right(cacheRandomQuote);
  //   } on CacheException {
  //     return Left(CacheFailure());
  //   }
  // }
}
  @override
  Future<Either<Failure, Quote>> getConcreteQuote() {
    // TODO: implement getConcreteQuote
    throw UnimplementedError();
  }

}