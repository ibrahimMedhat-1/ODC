import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/login/login.dart';
import 'package:odc_project/view/settings/faq/faq.dart';
import 'package:odc_project/view/settings/our_partners/our_partners.dart';
import 'package:odc_project/view/settings/support/support.dart';
import 'package:odc_project/view/settings/terms_conditions/terms_condition.dart';
import 'package:odc_project/view_model/bloc/settings/settings/settings_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) {

            },
            builder: (context, state) {
          SettingsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: const Text(
                    ' Settings',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => FAQ()));
                        },
                        child: ListTile(
                          leading: Text(
                            'FAQ',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsConditions()));
                        },
                        child: ListTile(
                          leading: Text(
                            'Terms & Conditions',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OurPartners()));
                        },
                        child: ListTile(
                          leading: Text(
                            'Our Partners',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Support()));
                        },
                        child: ListTile(
                          leading: Text(
                            'Support',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () async {
                          final token = await SharedPreferences.getInstance();
                          final email = await SharedPreferences.getInstance();
                          final password =
                              await SharedPreferences.getInstance();
                          token.setString('token', 'null');
                          email.setString('username', 'null');
                          password.setString('password', 'null');

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: ListTile(
                          leading: Text(
                            'Log Out',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
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
