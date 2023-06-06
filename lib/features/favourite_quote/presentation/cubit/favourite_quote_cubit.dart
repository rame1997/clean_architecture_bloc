import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_quote_state.dart';

class FavouriteQuoteCubit extends Cubit<FavouriteQuoteState> {
  FavouriteQuoteCubit() : super(FavouriteQuoteInitial());
}
