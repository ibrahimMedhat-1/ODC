import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';
import 'package:odc_project/view_model/database/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/terms.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
  static TermsCubit get(context) => BlocProvider.of(context);

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true,
    );
    return htmlText.replaceAll(exp, '');
  }

  TermsModel? modelData;
  void getData() {
    final token = SharedPreferences.getInstance();
    DioHelper.getData(url: termsEndPoint, token: token.toString())
        .then((value) {
      modelData = TermsModel.fromJson(value.data);
      emit(TermsInitial());
    }).catchError((e) {
      print('err');
    });
  }
}
