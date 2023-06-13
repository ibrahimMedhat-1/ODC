import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/view/login/login.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';

import '../../database/network/end_points.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  bool? focusname;
  bool? focusemail;
  bool? focuspass1;
  bool? focuspass2;
  bool? focusnum;
  bool obsecure = true;
  bool obsecure2 = true;

  Color nameColor = Colors.grey;
  Color emailColor = Colors.grey;
  Color pass1Color = Colors.grey;
  Color pass2Color = Colors.grey;
  Color numColor = Colors.grey;

  String genderValue = 'Male';
  String universityValue = 'AUC';
  String gradeValue = 'Grade 1';

  List<String> dropDownGenderList = [
    'Male',
    'Female',
  ];

  List<String> dropDownUniversityList = [
    'AUC',
    'Cairo',
    'ELU',
    'GUC',
    'Helwan',
    'HTI',
  ];

  List<String> dropDownGradeList = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
  ];

  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController pass1Cont = TextEditingController();
  TextEditingController pass2Cont = TextEditingController();
  TextEditingController numCont = TextEditingController();
  String? gender = 'm';
  int uniId = 1;
  int gradeId = 1;
  int roleId = 4;

  void signUpPress(context) async {
    //tohamymedo41@gmail.com
    //123456m

    String res = '';

    var json = {
      'email': emailCont.text.toString(),
      'name': nameCont.text.toString(),
      'gender': gender,
      'phoneNumber': numCont.text.toString(),
      'universityId': uniId,
      'gradeId': gradeId,
      'roleId': roleId,
      'password': pass1Cont.text.toString(),
    };

    print(json);
    await DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      res = value.data['code'].toString();
      // print(res);
    }).catchError((e) {
      print('er');
    });
    // print(res.toString());
    if (res == 'Success') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogIn()));
    } else {
      // print(res);
    }
    emit(SignupSuccsses());
  }

  void obseCure() {
    obsecure = !obsecure;

    emit(SignupInitial());
  }

  void obseCure2() {
    obsecure2 = !obsecure2;
    emit(SignupInitial());
  }

  void focusBordername() {
    if (focusname == true) {
      nameColor = Colors.deepOrange;
      emit(SignupInitial());
    } else {
      nameColor = Colors.grey;
      emit(SignupInitial());
    }
  }

  void focusBorderemail() {
    if (focusemail == true) {
      emailColor = Colors.deepOrange;
      emit(SignupInitial());
    } else {
      emailColor = Colors.grey;
      emit(SignupInitial());
    }
  }

  void focusBorderpass1() {
    if (focuspass1 == true) {
      pass1Color = Colors.deepOrange;
      emit(SignupInitial());
    } else {
      pass1Color = Colors.grey;
      emit(SignupInitial());
    }
  }

  void focusBorderpass2() {
    if (focuspass2 == true) {
      pass2Color = Colors.deepOrange;
      emit(SignupInitial());
    } else {
      pass2Color = Colors.grey;
      emit(SignupInitial());
    }
  }

  void focusBorderum() {
    if (focusnum == true) {
      numColor = Colors.deepOrange;
      emit(SignupInitial());
    } else {
      numColor = Colors.grey;
      emit(SignupInitial());
    }
  }

  void setGenderValue(v) {
    String x = v.toString();
    switch (x) {
      case 'Male':
        gender = 'm';
        break;
      case 'Female':
        gender = 'f';
        break;
    }
    genderValue = v.toString();
    emit(SignupInitial());
  }

  void setUniversityValue(string) {
    String x = string.toString();
    switch (x) {
      case 'AUC':
        uniId = 1;
        break;
      case 'Cairo':
        uniId = 2;
        break;
      case 'ELU':
        uniId = 3;
        break;
      case 'GUC':
        uniId = 4;
        break;
      case 'Helwan':
        uniId = 5;
        break;
      case 'HIT':
        uniId = 6;
        break;
    }
    universityValue = string;
    emit(SignupInitial());
  }

  void setGradValue(v) {
    String x = v.toString();
    switch (x) {
      case 'Grade 1':
        gradeId = 1;
        break;
      case 'Grade 2':
        gradeId = 2;
        break;
      case 'Grade 3':
        gradeId = 3;
        break;
      case 'Grade 4':
        gradeId = 4;
        break;
      case 'Grade 5':
        gradeId = 5;
        break;
    }
    gradeValue = v.toString();
    emit(SignupInitial());
  }
}
