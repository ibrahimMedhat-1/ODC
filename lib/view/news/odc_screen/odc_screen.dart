import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/components/components/components.dart';
import 'package:odc_project/view_model/bloc/news/odc/odc_cubit.dart';

class ODC_Screen extends StatelessWidget {
  const ODC_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OdcCubit(),
      child: BlocBuilder<OdcCubit, OdcState>(
        builder: (context, state) {
          return BlocConsumer<OdcCubit, OdcState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              OdcCubit.get(context);
              return Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment(-0.95, -0.7),
                      children: [
                        Container(
                          color: Colors.white,
                          height: 400,
                          width: double.infinity,
                          child: Center(
                            child: defaultTitle(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Hero(
                              tag: '1',
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    space(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ODCs',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2022-07-06',
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          space(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ODC Supports All Universities',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
