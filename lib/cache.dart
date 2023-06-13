import 'package:flutter/material.dart';
import 'package:odc_project/view_model/bloc/login/login_cubit.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit.check(context);
    return Container();
  }
}
