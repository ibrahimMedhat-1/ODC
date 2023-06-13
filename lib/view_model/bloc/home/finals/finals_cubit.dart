import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/finals.dart';
import '../../../database/network/end_points.dart';

part 'finals_state.dart';

class FinalsCubit extends Cubit<FinalsState> {
  FinalsCubit() : super(FinalsInitial());
  static FinalsCubit get(context) => BlocProvider.of(context);
  FinalsModel? modelData;
  final token = SharedPreferences.getInstance();

  void getData() async {
    final token = await SharedPreferences.getInstance();
    String? t = token.getString('token');
    await DioHelper.getData(url: examsEndPoint, token: t).then((value) {
      modelData = FinalsModel.fromJson(value.data);
      emit(FinalsInitial());
      print(modelData!.data![0]);
    });
  }
}
