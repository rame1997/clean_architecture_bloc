
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../splash/presentation/cubit/locale_cubit.dart';
import '../cubit/random_quote_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
          if (state is RandomQuoteIsLodaing) {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            );
          } else if (state is RandomQuoteError) {
            return error_widget.ErrorWidget(
              onPress: () => _getRandomQuote(),
            );
          } else if (state is RandomQuoteIsLodaed) {
            return Column(
              children: [
                QuoteContent(
                  quote: state.quote,
                ),
                InkWell(
                    onTap: () => _getRandomQuote(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.primary),
                      child: const Icon(
                        Icons.refresh,
                        size: 28,
                        color: Colors.white,
                      ),
                    ))
              ],
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            );
          }
        }));
  }
  @override
  Widget build(BuildContext context) {
     final appBar = AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.translate_outlined,
            color: AppColors.primary,
          ),
          onPressed: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              BlocProvider.of<LocaleCubit>(context).toArabic();
            } else {
              BlocProvider.of<LocaleCubit>(context).toEnglish();
            }
          },
        ),
       title: Text(AppLocalizations.of(context)!.translate('app_name')!),
     );
    return RefreshIndicator(

      onRefresh: ()=> _getRandomQuote()
      ,
      child: Scaffold(appBar: appBar, body: _buildBodyContent()),
    );
  }
}