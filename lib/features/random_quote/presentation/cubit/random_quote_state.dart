part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLodaing extends RandomQuoteState {

}

class RandomQuoteIsLodaed extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteIsLodaed.RandomQuoteLodaed({required this.quote});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RandomQuoteError extends RandomQuoteState {
  final String msg;

  RandomQuoteError({required this.msg});

  @override
// TODO: implement props
  List<Object> get props => [];
}
