import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/components/components/components.dart';
import 'package:odc_project/view/signup/signup.dart';
import 'package:odc_project/view_model/bloc/login/login_cubit.dart';

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // LoginCubit.check(context);
    // void toast() => Flutter toast.showToast(
    //     msg: "This is a Toast message", // message
    //     toastLength: Toast.LENGTH_SHORT, // length
    //     gravity: ToastGravity.CENTER, // location
    //     timeInSecForIosWeb: 1 // duration
    //     );
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              LoginCubit l = LoginCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: defaultTitle()),
                body: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //login
                            const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            //space
                            space(),
                            //email
                            Form(
                              key: form,
                              child: Column(
                                children: [
                                  defaultText(
                                    colorText: l.cm,
                                    errorText: 'E-Mail Must Not Be Empty',
                                    cont: l.emailCont,
                                    keyBoard: TextInputType.emailAddress,
                                    text: 'E-Mail',
                                    onFocus: (t) {
                                      l.txtState1 = t;
                                      l.focusBorder1();
                                    },
                                    suffixTap: () {},
                                  ),
                                  //space
                                  space(),
                                  //password
                                  defaultText(
                                    colorText: l.cp,
                                    errorText: 'Password Must Not Be Empty',
                                    cont: l.passCont,
                                    keyBoard: TextInputType.emailAddress,
                                    text: 'Password',
                                    onFocus: (t) {
                                      l.txtState2 = t;
                                      l.focusBorder2();
                                    },
                                    obsCure: l.pass,
                                    sufFixIcon: l.pass
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off,
                                    sufFixIconColor: Colors.deepOrange,
                                    suffixTap: () {
                                      l.obseCure();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //forgot password
                            TextButton(
                              onPressed: () {
                                // toast();
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                            ),
                            space(height: 60),
                            //login button
                            InkWell(
                              onTap: () async {
                                if (form.currentState!.validate()) {
                                  l.loginPress(context);
                                } else {
                                  return null;
                                }
                              },
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF4D00),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            //space
                            space(),
                            //divider
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ),
                                const Text(
                                  'OR',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            //space
                            space(),
                            //sign up
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.deepOrangeAccent,
                                        width: 2)),
                                width: double.infinity,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
