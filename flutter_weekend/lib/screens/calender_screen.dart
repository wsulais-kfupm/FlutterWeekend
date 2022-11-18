
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
           child: SfCalendarTheme(
                data: SfCalendarThemeData(
                    brightness: Brightness.dark,
                  backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
                ), 
                   
                    
                    
                
                child: SafeArea(
            child: SfCalendar(
              view: CalendarView.day,
              allowedViews:const [
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
        
      ),
    );
  }
 
  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime:DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 3)),
      subject: 'Planning',
      color: Colors.green,
    ));
 
    return _AppointmentDataSource(appointments);
  }
}
 
class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}