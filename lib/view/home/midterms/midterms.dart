import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/home/midterms/midterms_cubit.dart';

class Midterms extends StatelessWidget {
  const Midterms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MidtermsCubit()..getData(),
      child: BlocBuilder<MidtermsCubit, MidtermsState>(
        builder: (context, state) {
          return BlocConsumer<MidtermsCubit, MidtermsState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              MidtermsCubit m = MidtermsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  title: const Text(
                    'Midterms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                double.maxFinite,
                                0,
                                0,
                                double.negativeInfinity,
                              ),
                              items: [
                                PopupMenuItem(child: Text("All Lecture")),
                                PopupMenuItem(child: Text("Finished Lectures")),
                                PopupMenuItem(
                                    child: Text("Remaining Lectures")),
                              ]);
                        },
                        icon: Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.deepOrangeAccent,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
                body: Container(
                  child: m.modelData == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: Column(
                              children: [
                                //flutter -icon - hrs
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //flutter
                                      Text(
                                        m.modelData!.data![index].examSubject!
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      //icon - hrs
                                      Row(
                                        children: const [
                                          Icon(Icons.timer),
                                          Text(
                                            '2hrs',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //space
                                const SizedBox(
                                  height: 20,
                                ),
                                //lecture - start time - end time
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //lecture
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Lecture Day',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons
                                                  .calendar_month_outlined),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                m.modelData!.data![index]
                                                    .examDate
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      //start time
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Start Time',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.access_time_filled_sharp,
                                                color: Colors.greenAccent,
                                              ),
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                              Text(
                                                m.modelData!.data![index]
                                                    .examStartTime
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      //End Time
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'End Time',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.access_time_filled_sharp,
                                                color: Color(0xFFFFBDBD),
                                              ),
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                              Text(
                                                m.modelData!.data![index]
                                                    .examEndTime
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: m.modelData!.data!.length,
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
