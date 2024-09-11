import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/source.dart';
//import 'package:meta/meta.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  NewsScreenCubit() : super(NewsInitial());
  void getTabs(String categoryId) async {
    try {
      emit(SourceLoading());
      var response = await ApiManager.getSourcesByCategory(categoryId);
      if (response?.status == 'error') {
        emit(SourceError(errMsg: response!.message!));
        return;
      }
      if (response?.status == 'ok' && response!.sources!.isNotEmpty) {
        emit(SourceSuccess(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceError(errMsg: e.toString()));
    }
  }

  void getNewsArticles(String sourceId) async {
    try {
      emit(NewsLoading());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsError(errMsg: response!.message!));
      } else {
        if (response!.articles!.isNotEmpty) {
          emit(NewsSuccess(newsList: response.articles));
        }
      }
    } catch (e) {
      emit(NewsError(errMsg: e.toString()));
    }
  }
}
