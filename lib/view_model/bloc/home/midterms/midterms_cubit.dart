import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/mid_model.dart';
import '../../../database/network/dio_helper.dart';
import '../../../database/network/end_points.dart';

// import 'package:odc_project/view_model/database/network/dio_helper.dart';
// import 'package:odc_project/view_model/database/network/end_points.dart';

part 'midterms_state.dart';

class MidtermsCubit extends Cubit<MidtermsState> {
  MidtermsCubit() : super(MidtermsInitial());
  static MidtermsCubit get(context) => BlocProvider.of(context);
  MidModel? modelData;
  void getData() async {
    final token = await SharedPreferences.getInstance();
    String? t = token.getString('token');

    DioHelper.getData(url: examsEndPoint, token: t).then((value) {
      modelData = MidModel.fromJson(value.data);
      emit(MidtermsInitial());
      print(modelData!.data![0]);
    });
  }
}
