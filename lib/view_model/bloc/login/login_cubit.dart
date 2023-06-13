import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:odc_project/model/login_model.dart';
import 'package:odc_project/view/bottom_nav/bottom_nav.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';
import 'package:odc_project/view_model/database/network/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../token.dart';
import '../../../view/login/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool? txtState1;
  bool? txtState2;
  Color cm = Colors.grey;
  Color cp = Colors.grey;
  bool pass = true;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String nav = '';

  LoginModel modelData = LoginModel();
  static check(context) async {
    final username = await SharedPreferences.getInstance();
    final password = await SharedPreferences.getInstance();
    final token = await SharedPreferences.getInstance();
    String? userName = username.getString('username');
    String? Password = password.getString('password');
    String? tokenn = token.getString('token');
    print(userName);
    print(Password);
    print(tokenn);

    if (userName == 'null' || Password == 'null' || token == 'null') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogIn()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Nav()));
    }
  }

  void loginPress(context) async {
    //tohamymedo41@gmail.com
    //123456m

    Map<String, dynamic> json = {
      'email': emailCont.text,
      'password': passCont.text,
    };

    await DioHelper.postData(url: loginEndPoint, data: json)
        .then((value) async {
      if (value.statusCode == 200) {
        modelData = LoginModel.fromJson(value.data);
        TOKEN = modelData.data!.accessToken.toString();
      } else {
        toast();
      }
      if (TOKEN != '' || TOKEN!.isNotEmpty || TOKEN != null) {
        final username = await SharedPreferences.getInstance();
        final password = await SharedPreferences.getInstance();
        final token = await SharedPreferences.getInstance();
        token.setString('token', TOKEN);
        print(token);
        username.setString('username', emailCont.text);
        print(username);
        password.setString('password', passCont.text);
        print(password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Nav()));
      } else {
        toast();
        print('errorr');
      }
      print(TOKEN);
    }).catchError((e) {
      final snackBar = SnackBar(
        content: const Text(
          'Login Failed',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: (Colors.deepOrange),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'dismiss',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(nav);
    });

    emit(LoginSucsses());
  }

  void focusBorder1() {
    if (txtState1 == true) {
      cm = Colors.deepOrangeAccent;
    } else {
      cm = Colors.grey;
    }
    emit(LoginInitial());
  }

  void focusBorder2() {
    if (txtState2 == true) {
      cp = Colors.deepOrangeAccent;
    } else {
      cp = Colors.grey;
    }
    emit(LoginInitial());
  }

  void obseCure() {
    pass = !pass;
    emit(LoginInitial());
  }

  void toast() {
    Fluttertoast.showToast(
        msg: 'logina Failed',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
