import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/model/lecmodel.dart';
import 'package:odc_project/token.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';
import 'package:odc_project/view_model/database/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());
  late int index;
  static LecturesCubit get(context) => BlocProvider.of(context);
  LecModel? modelData;

  getLec() async {
    Response res;
    print(TOKEN);
    final token = await SharedPreferences.getInstance();
    String? t = token.getString('token');
    print(token);

    await DioHelper.getData(url: lectureEndPoint, token: t).then((value) {
      modelData = LecModel.fromJson(value.data);
      index = modelData!.data!.length;
      emit(LecturesInitial());
    }).catchError((onError) {
      print('error');
    });
  }
}
