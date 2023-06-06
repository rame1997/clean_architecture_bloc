import 'package:bloc/bloc.dart';
import 'package:clean_art_project/core/error/Failure.dart';
import 'package:clean_art_project/core/usecases/usecase.dart';
import 'package:clean_art_project/features/random_quote/domain/entities/quote.dart';
import 'package:clean_art_project/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/app_strings.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  //تعامل الكويبت مع اليويسكيس
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLodaing());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
            (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
            (quote) => RandomQuoteIsLodaed.RandomQuoteLodaed(quote: quote)));
  }
  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
