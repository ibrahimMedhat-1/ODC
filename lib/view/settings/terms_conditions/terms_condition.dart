import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/settings/terms/terms_cubit.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getData(),
      child: BlocBuilder<TermsCubit, TermsState>(
        builder: (context, state) {
          return BlocConsumer<TermsCubit, TermsState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              TermsCubit terms = TermsCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(20),
                  child: terms.modelData == null
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Terms and Conditions',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  BlocConsumer<TermsCubit, TermsState>(
                                    listener: (context, state) {

                                    },
                                    builder: (context, state) {
                                      return Text(
                                        terms.removeAllHtmlTags(terms
                                            .modelData!.data!.terms
                                            .toString()),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[700],
                                        ),
                                      );
                                    },
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
