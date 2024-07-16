import 'package:bloc/bloc.dart';
import 'package:iti_summer_7_newsapp/data/cubits/get_news_cubit/get_news_state.dart';
import 'package:iti_summer_7_newsapp/data/models/get_news_model.dart';
import 'package:iti_summer_7_newsapp/data/repositories/get_news_repo.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());

  Future<void> getNews() async {
    emit(GetNewsLoading());

    GetNewsModel? response = await GetNewsRepo().getNews();

    if (response != null) {
      emit(GetNewsSuccess(response));
    } else {
      emit(GetNewsError());
    }
  }
}
