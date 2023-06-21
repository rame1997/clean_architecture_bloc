import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/utils/map_failure_msg.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/post_parameter.dart';
import '../../domain/entities/post_parameter.dart';
import '../../domain/usecases/get_post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPost getPostUseCase;

  PostBloc({required this.getPostUseCase}) : super(PostState()) {
    on<PostEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == PostStatus.loading) {
            // emit(RandomQuoteIsLodaing());
            // Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
            // emit(response.fold(
            //         (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
            //         (quote) => RandomQuoteIsLodaed.RandomQuoteLodaed(quote: quote)));

            Either<Failure, List<Post>> response =
                await getPostUseCase(new PostParameter());
            response.fold((failure) {
              return PostError(msg: MapFailureToMsg.mapFailureToMsg(failure));
            }, (Posts) {
              return Posts.isEmpty
                  ? emit(state.copyWith(
                      status: PostStatus.success, hasReachedMax: true))
                  : emit(state.copyWith(
                      status: PostStatus.success,
                      posts: Posts,
                      hasReachedMax: false));
            });
          } else {
            Either<Failure, List<Post>> response =
                await getPostUseCase(new PostParameter(state.posts.length));
            response.fold((failure) {
              return PostError(msg: MapFailureToMsg.mapFailureToMsg(failure));
            }, (Posts) {
              return Posts.isEmpty //وصلنا لنهاية البوست
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      status: PostStatus.success,
                      posts: List.of(state.posts)..addAll(Posts),
                      hasReachedMax: false));
            });
          }
        } catch (e) {
          print("fjhjf" + e.toString());
          emit(state.copyWith(
              status: PostStatus.error, errorMessage: "failed to fetch Post"));
        }
      }
    },
        //هادا بيحدد كيف يتعامل البلوك مع الااحداث
        //و لو ضيفت اكتر من حدث حيتعامل معاهم البلوك بشكل متوازي بشكل تلقائي
        //علشان هيك بدنا نغيير في التعامل عن طريق باكج bloc_concurrency
        //في اكثر من حالة بتدعم هادي المكتبة اربع انواع هان بالحالة هادي بنحتاج لل
        transformer: droppable());
  }
}
