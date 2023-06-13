import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/settings/support/support_cubit.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(),
      child: BlocBuilder<SupportCubit, SupportState>(
        builder: (context, state) {
          return BlocConsumer<SupportCubit, SupportState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              SupportCubit.get(context);
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
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  title: const Text(
                    'Support',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //name
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 25,
                              ),
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Name',
                              labelStyle: const TextStyle(fontSize: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        //email
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 25,
                              ),
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'E-Mail',
                              labelStyle: const TextStyle(fontSize: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        //big text
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            minLines: 7,
                            maxLines: 20,
                            decoration: InputDecoration(
                              hintText: 'What\'s making you unhappy?',
                              hintStyle: const TextStyle(
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        //submit
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
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
