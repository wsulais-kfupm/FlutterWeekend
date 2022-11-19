import 'package:flutter/material.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});
  static const String id = 'calander_screen';

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SfCalendarTheme(
              data: SfCalendarThemeData(
                brightness: Brightness.light,
                backgroundColor:
                    //  _isDark ? Theme.of(context).cardColor :
                    Colors.white,
              ),
              child: SafeArea(
                child: SfCalendar(
                  view: CalendarView.day,
                  allowedViews: const [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                    CalendarView.timelineMonth,
                    CalendarView.schedule
                  ],
                  dataSource: _getCalendarDataSource(),
                  todayHighlightColor: Colors.green,
                ),
              )),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider/dark_theme_provider.dart';

// class CalenderScreen extends StatefulWidget {
//   const CalenderScreen({Key? key}) : super(key: key);

//   @override
//   State<CalenderScreen> createState() => _CalenderScreenState();
// }

// class _CalenderScreenState extends State<CalenderScreen> {
//   @override
//   Widget build(BuildContext context) {

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(const Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.blue,
  ));
  appointments.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2)),
      endTime: DateTime.now().add(const Duration(hours: 3)),
      subject: 'Planning',
      color: Colors.green,
    ),
  );
  // appointments.add(
  //   Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 2)),
  //     endTime: DateTime.now().add(const Duration(hours: 3)),
  //     subject: 'Presentation',
  //     color: Colors.green,
  //   ),
  // );
  // appointments.add(
  //   Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 2)),
  //     endTime: DateTime.now().add(const Duration(hours: 3)),
  //     subject: 'Is it done already? ',
  //     color: Colors.green,
  //   ),
  // );

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
