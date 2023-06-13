import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/home/sections/sections_cubit.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionsCubit()..getData(),
      child: BlocBuilder<SectionsCubit, SectionsState>(
        builder: (context, state) {
          return BlocConsumer<SectionsCubit, SectionsState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              SectionsCubit s = SectionsCubit.get(context);
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
                    'Sections',
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
                                double.maxFinite, 0, 0, double.infinity),
                            items: [
                              PopupMenuItem(child: Text("All Lecture")),
                              PopupMenuItem(child: Text("Finished Lectures")),
                              PopupMenuItem(child: Text("Remaining Lectures")),
                            ],
                            elevation: 8.0,
                          );
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
                  child: s.modelData == null
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
                                        s.modelData!.data![index].sectionSubject
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
                                                s.modelData!.data![index]
                                                    .sectionDate
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
                                                s.modelData!.data![index]
                                                    .sectionStartTime
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
                                                s.modelData!.data![index]
                                                    .sectionEndTime
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
                          itemCount: s.modelData!.data!.length,
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
