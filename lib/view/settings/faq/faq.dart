import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/settings/faq/faq_cubit.dart';

// ignore: must_be_immutable
class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getData(),
      child: BlocBuilder<FaqCubit, FaqState>(
        builder: (context, state) {
          return BlocConsumer<FaqCubit, FaqState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              FaqCubit faq = FaqCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text(
                    'FAQ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                body: Container(
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: faq.modelData.data == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: faq.modelData.data!.length,
                          itemBuilder: (context, index) => ExpansionTile(
                            collapsedBackgroundColor: Colors.deepOrange,
                            backgroundColor: Colors.grey,
                            title: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: BlocConsumer<FaqCubit, FaqState>(
                                listener: (context, state) {

                                },
                                builder: (context, state) {
                                  return Text(
                                    faq.removeAllHtmlTags(
                                        faq.modelData.data![index].question!),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            ),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: BlocConsumer<FaqCubit, FaqState>(
                                  listener: (context, state) {
                                  },
                                  builder: (context, state) {
                                    return Text(
                                      faq.removeAllHtmlTags(
                                          faq.modelData.data![index].answer!),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
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
