import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_with_bloc2/models/news_model.dart';
import 'package:news_app_with_bloc2/repo/news_sevice.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsService) : super(NewsLoading()) {
    on<NewsEvent>((event, emit) {});
    on<NewsFetchEvent>(_getNewsByCountry);
  }

  final NewsService newsService;
  Future<void> _getNewsByCountry(
      NewsFetchEvent event, Emitter<NewsState> emit) async {
    if (state is! NewsLoading) emit(NewsLoading());
    final news = await newsService.getNewsByCountry(event.countryCode);
    if (news != null) {
      emit(NewsSuccess(news));
    } else {
      emit(NewsError('Belgisiz kata'));
    }
  }
}
