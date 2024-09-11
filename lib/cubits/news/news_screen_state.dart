part of 'news_screen_cubit.dart';

//@immutable
sealed class NewsScreenState {}

//newsList States
final class NewsInitial extends NewsScreenState {}

final class NewsLoading extends NewsScreenState {}

final class NewsError extends NewsScreenState {
  final String errMsg;

  NewsError({required this.errMsg});
}

final class NewsSuccess extends NewsScreenState {
  final List<Articles>? newsList;

  NewsSuccess({required this.newsList});
}
//SourceTaps States

final class SourceInitial extends NewsScreenState {}

final class SourceLoading extends NewsScreenState {}

final class SourceError extends NewsScreenState {
  final String errMsg;

  SourceError({required this.errMsg});
}

final class SourceSuccess extends NewsScreenState {
  final List<Sources> sourcesList;

  SourceSuccess({required this.sourcesList});
}
