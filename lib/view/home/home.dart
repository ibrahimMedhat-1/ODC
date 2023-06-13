import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/components/components/components.dart';
import 'package:odc_project/view/home/finals/finals.dart';
import 'package:odc_project/view/home/lectures/lectures.dart';
import 'package:odc_project/view/home/midterms/midterms.dart';
import 'package:odc_project/view/home/notes/notes.dart';
import 'package:odc_project/view/home/sections/sections.dart';
import 'package:odc_project/view_model/bloc/home/home/home_cubit.dart';

import 'events/events.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {

            },
            builder: (context, state) {
             HomeCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: defaultTitle(),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // lectures - sections
                        Row(
                          children: [
                            //lectures
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lectures(),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                ),
                                                Container(
                                                  height: 45,
                                                  width: 45,
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: Image.asset(
                                                      'assets/lectures.jpg'),
                                                ),
                                              ]),
                                          //text
                                          const Text(
                                            'Lectures',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //sections
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Sections()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              Container(
                                                height: 45,
                                                width: 45,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    'assets/sections.png'),
                                              ),
                                            ],
                                          ),
                                          //text
                                          const Text(
                                            'Sections',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // mid - finals
                        Row(
                          children: [
                            //mid
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Midterms()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              Container(
                                                height: 45,
                                                width: 45,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    'assets/midterms.png'),
                                              ),
                                            ],
                                          ),
                                          //text
                                          const Text(
                                            'Midterms',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //finals
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Finals()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              Container(
                                                height: 45,
                                                width: 45,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    'assets/finals.png'),
                                              ),
                                            ],
                                          ),
                                          //text
                                          const Text(
                                            'Finals',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // events - notes
                        Row(
                          children: [
                            //events
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Events()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              Container(
                                                height: 45,
                                                width: 45,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    'assets/events.png'),
                                              ),
                                            ],
                                          ),
                                          //text
                                          const Text(
                                            'Events',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //notes
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Notes()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //image
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              Container(
                                                height: 45,
                                                width: 45,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    'assets/notes.png'),
                                              ),
                                            ],
                                          ),
                                          //text
                                          const Text(
                                            'Notes',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
