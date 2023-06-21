import 'package:clean_art_project/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:clean_art_project/injection_container.dart' as di;
import 'config/locale/app_localizations_setup.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/post/presentation/bloc/post_bloc.dart';
import 'features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/splash/presentation/cubit/locale_cubit.dart';
class QuoteApp extends StatelessWidget {
  const QuoteApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<RandomQuoteCubit>()),
          //بردو لازم في الlogin تستدعي ميثود تبعت الشيرد بريفرنس الي بتقول انوا مسجل الدخول
          BlocProvider(create: (context) => di.sl<LocaleCubit>()..getSavedLang()),
          BlocProvider(
              create: (_) =>di.sl<PostBloc>()..add(GetPostsEvent())),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
              AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}