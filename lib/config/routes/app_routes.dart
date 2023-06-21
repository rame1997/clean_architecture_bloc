import 'package:clean_art_project/features/favourite_quote/presentation/pages/favourite_quote_screen.dart';
import 'package:clean_art_project/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_art_project/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_art_project/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_strings.dart';
import '../../features/post/presentation/screens/posts_screen.dart';
import '../../features/random_quote/domain/usecases/get_random_quote.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';
import 'package:clean_art_project/injection_container.dart' as di;
class Routes {
  static const String initialRoute = '/';
  static const String favouritQuoteRoute = '/favouriteQuote';
  static const String randomQuoteRoute = '/randomQuoteRoute';
  static const String postRoute = '/postsScreen';

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(

            create: (context) => di.sl<RandomQuoteCubit>(),
            child: SplashScreen(),
          );
        });

      case Routes.favouritQuoteRoute:
        return MaterialPageRoute(builder: ((context) {
          return const FavouriteQuoteSccreen();
        }));
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: ((context) {
          return const QuoteScreen();
        }));
        case Routes.postRoute:
        return MaterialPageRoute(builder: ((context) {
          return const PostsScreen();
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) =>
        const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}