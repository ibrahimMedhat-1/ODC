import 'package:flutter/material.dart';

Widget customCard() => Card(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //flutter
                const Text(
                  'Flutter',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //lecture
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lecture Day',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Wednesday',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Time',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.access_time_filled_sharp,
                          color: Colors.greenAccent,
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text(
                          '12:00pm',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End Time',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.access_time_filled_sharp,
                          color: Color(0xFFFFBDBD),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text(
                          '2:00pm',
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
    );
