import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/sectionmodel.dart';
import '../../../database/network/dio_helper.dart';
import '../../../database/network/end_points.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  static SectionsCubit get(context) => BlocProvider.of(context);
  SectionModel? modelData;
  void getData() async {
    final token = await SharedPreferences.getInstance();

    String? t = token.getString('token');

    DioHelper.getData(url: sectionEndPoint, token: t).then((value) {
      modelData = SectionModel.fromJson(value.data);
      emit(SectionsInitial());
    });
  }
}
