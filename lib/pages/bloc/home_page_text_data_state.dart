part of 'home_page_text_data_cubit.dart';

@immutable
abstract class HomePageTextDataState {}

class HomePageTextDataInitial extends HomePageTextDataState {}
class HomePageLoading extends HomePageTextDataState {}
class HomePageError extends HomePageTextDataState {}
class HomePageSuccess extends HomePageTextDataState {}
