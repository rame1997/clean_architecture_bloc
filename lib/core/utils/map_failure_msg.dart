
import '../error/Failure.dart';
import 'app_strings.dart';
class MapFailureToMsg{
  static String mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailure;
    case CacheFailure:
      return AppStrings.cacheFailure;

    default:
      return AppStrings.unexpectedError;
  }
}}