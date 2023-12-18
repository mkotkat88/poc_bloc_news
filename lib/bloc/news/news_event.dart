part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
class NewsDataEvent extends NewsEvent {
  final String countryCode;
  NewsDataEvent(this.countryCode);
}