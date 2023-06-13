import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/view_model/database/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/news.dart';
import '../../../database/network/dio_helper.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  NewsScreenCubit() : super(NewsScreenInitial());
  static NewsScreenCubit get(context) => BlocProvider.of(context);

  NewsModel? modelData;
  void getData() async {
    final token = await SharedPreferences.getInstance();
    String? t = token.getString('token');

    await DioHelper.getData(url: newsEndPoint, token: t).then((value) {
      modelData = NewsModel.fromJson(value.data);
      emit(NewsScreenInitial());
      print(modelData!.data![0].title);
    }).catchError((e) {
      print('err');
    });
    emit(NewsScreenInitial());
  }
}
