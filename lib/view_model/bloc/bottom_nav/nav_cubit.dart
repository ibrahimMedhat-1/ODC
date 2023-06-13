import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/home/home.dart';
import 'package:odc_project/view/news/news.dart';
import 'package:odc_project/view/settings/settings.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());
  static NavCubit get(context) => BlocProvider.of(context);
  int item = 0;

  List screen = [
    Home(),
    News(),
    Settings(),
  ];
  void indexChange(int index) {
    item = index;
    emit(NavInitial());
  }

  Widget open(int index) {
    return screen[index];
  }
}
