import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/components/components/components.dart';
import 'package:odc_project/view/login/login.dart';
import 'package:odc_project/view_model/bloc/signup/signup_cubit.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              SignupCubit s = SignupCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    title: defaultTitle(),
                  ),
                  body: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                space(),
                                defaultText(
                                  errorText: 'Name Must Not Be Empty',
                                  suffixTap: () {},
                                  cont: s.nameCont,
                                  keyBoard: TextInputType.name,
                                  text: 'Name',
                                  colorText: s.nameColor,
                                  focusColor: Colors.deepOrange,
                                  onFocus: (S) {
                                    s.focusname = S;
                                    s.focusBordername();
                                  },
                                ),
                                space(),
                                defaultText(
                                  errorText: 'E-Mail Must Not Be Empty',
                                  suffixTap: () {},
                                  cont: s.emailCont,
                                  keyBoard: TextInputType.emailAddress,
                                  text: 'E-Mail',
                                  onFocus: (t) {
                                    s.focusemail = t;
                                    s.focusBorderemail();
                                  },
                                  colorText: s.emailColor,
                                ),
                                space(),
                                defaultText(
                                  errorText: 'Password Must Not Be Empty',
                                  obsCure: s.obsecure,
                                  cont: s.pass1Cont,
                                  keyBoard: TextInputType.emailAddress,
                                  text: 'Password',
                                  onFocus: (t) {
                                    s.focuspass1 = t;
                                    s.focusBorderpass1();
                                  },
                                  colorText: s.pass1Color,
                                  sufFixIcon: s.obsecure
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  sufFixIconColor: Colors.deepOrange,
                                  suffixTap: () {
                                    s.obseCure();
                                  },
                                ),
                                space(),
                                defaultText(
                                  errorText: 'Password Must Not Be Empty',
                                  obsCure: s.obsecure2,
                                  cont: s.pass2Cont,
                                  keyBoard: TextInputType.visiblePassword,
                                  text: 'Password',
                                  onFocus: (t) {
                                    s.focuspass2 = t;
                                    s.focusBorderpass2();
                                  },
                                  colorText: s.pass2Color,
                                  sufFixIcon: s.obsecure2
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  sufFixIconColor: Colors.deepOrange,
                                  suffixTap: () {
                                    s.obseCure2();
                                  },
                                ),
                                space(),
                                defaultText(
                                  errorText: 'Phone Number Must Not Be Empty',
                                  suffixTap: () {},
                                  cont: s.numCont,
                                  keyBoard: TextInputType.phone,
                                  text: 'Phone Number',
                                  colorText: s.numColor,
                                  onFocus: (t) {
                                    s.focusnum = t;
                                    s.focusBorderum();
                                  },
                                ),
                                space(),
                                // gender - university
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    defaultDropButton(
                                        text: 'Gender',
                                        value: s.genderValue,
                                        dropDownList: s.dropDownGenderList,
                                        onChanged: (v) {
                                          s.setGenderValue(v);
                                        }),
                                    //gender drop
                                    defaultDropButton(
                                        text: 'University',
                                        value: s.universityValue,
                                        dropDownList: s.dropDownUniversityList,
                                        onChanged: (v) {
                                          s.setUniversityValue(v);
                                        }),
                                    //university
                                  ],
                                ),
                                space(),
                                // grade
                                BlocConsumer<SignupCubit, SignupState>(
                                  listener: (context, state) {
                                  },
                                  builder: (context, state) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          defaultDropButton(
                                            text: 'Grade',
                                            value: s.gradeValue,
                                            dropDownList: s.dropDownGradeList,
                                            onChanged: (v) {
                                              s.setGradValue(v);
                                            },
                                          ),
                                        ]);
                                  },
                                ),
                                space(height: 30),
                                InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        s.signUpPress(context);
                                        print('signup');
                                      } else {
                                        return null;
                                      }
                                    },
                                    child: defaultButton(text: 'Sign Up')),
                                space(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                space(),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogIn()));
                                  },
                                  child: defaultButton(
                                    text: 'Login',
                                    backgroundColor: Colors.white,
                                    textColor: Colors.deepOrange,
                                  ),
                                ),
                                space(),
                              ]),
                        ),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
