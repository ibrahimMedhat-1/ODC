import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());
  static TextCubit get(context) => BlocProvider.of(context);

  String text = '';
  TextEditingController txtcont = TextEditingController();
  void printName(String txtcont) {
    text = txtcont.toString();
    emit(TextInitial());
  }
}
