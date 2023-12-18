import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data_layer/model/news/news_model.dart';
import '../../repository/base_repository_imp.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final _newsRepo = BaseRepositoryImp();
  int page = 1;
  bool haveMoreData = false;

  NewsBloc() : super(NewsInitial()) {
    on<NewsDataEvent>(_fetchNewsListPagination);
  }

  FutureOr<void> _fetchNewsListPagination(NewsEvent event, Emitter<NewsState> emit) async {
    if(event is NewsDataEvent) {
      if(page == 1) {
        emit(NewsPageLoading());
      }
      await _newsRepo
          .getNewsData(event.countryCode,page)
          .onError((error, stackTrace) => emit(NewsPageError(error.toString())))
          .then((value) {
        NewsModel objNewsModel = NewsModel.fromJson(value);
        if (objNewsModel.status == "ok") {
          emit(NewsPageLoaded(objNewsModel));
          page++;
        } else {
          emit(NewsPageError(objNewsModel.message));
        }
      });
    }
  }
}
