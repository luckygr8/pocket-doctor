import 'package:pocket_doctor/components/appointment_res.dart';
import 'package:pocket_doctor/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:pocket_doctor/config/const.dart';

class AppointmentsPage extends StatelessWidget {
  List<AppointmentTile> createAppointmentTiles() {
    List<AppointmentTile> appointmentsTiles = [];
    for (int i = 1; i <= 10; i++) {
      appointmentsTiles.add(
        AppointmentTile(
          appointment: Appointment(
            doctorName: 'Dr. Batra$i',
            description: 'Normal checkup',
            isActive: i % 2 == 0 ? true : false,
            date: DateTime(2020, 8, i),
          ),
        ),
      );
    }
    return appointmentsTiles;
  }

  @override
  Widget build(BuildContext context) {
//    return ListView(
//      physics: BouncingScrollPhysics(),
//      children: createAppointmentTiles(),
//    );
  return NoAppointmentFound();
  }
}

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  AppointmentTile({this.appointment});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: appointment.isActive ? primaryColorDark : primaryColor,
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: lightColor,
        border: Border.all(
          color: appointment.isActive ? primaryColorDark : primaryColor,
          width: 4.0,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: primaryColorDark,
              radius: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Aug'),
                  Text(appointment.date.day.toString()),
                  //Text('19'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  appointment.doctorName,
                  style: TextStyle(fontFamily: 'Comfortaa', color: darkColor),
                ),
                Text(
                  appointment.description,
                  style: TextStyle(fontFamily: 'Comfortaa', color: darkColor),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.check_circle,
                        color: primaryColorDark,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: primaryColorDark,
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Attention'),
                            content: Text(
                                'Are you sure to permanently delete this appointment?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: primaryColorDark,
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Edit'),
                            content: Column(
                              children: <Widget>[
                                Text('Click edit to save changes'),
                                TextFormField(
                                  initialValue: appointment.doctorName,
                                ),
                                TextFormField(
                                  initialValue: appointment.description,
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text('Edit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
