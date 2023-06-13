import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/model/faq_model.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';
import 'package:odc_project/view_model/database/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static FaqCubit get(context) => BlocProvider.of(context);

  String? x;
  String? q;
  String? a;
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true,
    );
    return htmlText.replaceAll(exp, '');
  }

  FaqModel modelData = FaqModel();
  void getData() async {
    final token = await SharedPreferences.getInstance();
    String? t = token.getString('token');
    DioHelper.getData(url: faqEndPoint, token: t).then((value) {
      modelData = FaqModel.fromJson(value.data);
      emit(FaqInitial());
    });
  }
}
