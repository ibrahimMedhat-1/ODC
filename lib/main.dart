import 'package:flutter/material.dart';
import 'package:odc_project/cache.dart';
import 'package:odc_project/view_model/database/network/dio_helper.dart';

main() async {
  await DioHelper.init();
  // // Autogenerated modelData;
  // var json = {'email': 'tohamymedo41@gmail.com', 'password': "123456m"};
  // DioHelper.postData(url: loginEndPoint, data: json).then((value) {
  //   print(value.data['code']);
  // });

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}