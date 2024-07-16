import 'package:iti_summer_7_newsapp/data/models/get_news_model.dart';

sealed class GetNewsState {}

class GetNewsInitial extends GetNewsState {}

class GetNewsLoading extends GetNewsState {}

class GetNewsSuccess extends GetNewsState {
  final GetNewsModel responseModel;
  GetNewsSuccess(this.responseModel);
}

class GetNewsError extends GetNewsState {}
