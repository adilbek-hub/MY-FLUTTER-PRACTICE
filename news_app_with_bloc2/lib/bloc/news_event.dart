part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsFetchEvent extends NewsEvent {
  const NewsFetchEvent([this.countryCode = 'us']);
  final String countryCode;
}
