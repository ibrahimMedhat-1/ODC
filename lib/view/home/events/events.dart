import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view_model/bloc/home/events/events_cubit.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Program Start',
        DateTime(today.year, today.month, 1, 9, 30, 0),
        DateTime(today.year, today.month, 1, 16, 30, 0),
        const Color(0xFF0F8644),
        false));
    meetings.add(Meeting(
        'Program End',
        DateTime(today.year, today.month, 6, 9, 30, 0),
        DateTime(today.year, today.month, 6, 16, 30, 0),
        const Color(0xFF0F8644),
        false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsCubit(),
      child: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          return BlocConsumer<EventsCubit, EventsState>(
            listener: (context, state) {
            },
            builder: (context, state) {
             EventsCubit.get(context);
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
                    'Midterms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: SfCalendar(
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: MonthViewSettings(
                      showAgenda: true,
                      agendaViewHeight: 300,
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                  appointmentTextStyle: TextStyle(
                    fontSize: 20,
                  ),
                  view: CalendarView.month,
                  initialDisplayDate: DateTime.now(),
                  cellBorderColor: Colors.transparent,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
