import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime/services/worldtimeapi.dart';

class gps extends StatefulWidget {
  @override
  _gpsState createState() => _gpsState();
}

class _gpsState extends State<gps> {
  Position _currentPosition;
  String timez = "loading";
  String city="lk";
  String location="k";



 Future<void>  realloation() async {

    await _getCurrentLocation();

    double dstOffset = _currentPosition.latitude;
    double rawOffset = _currentPosition.longitude;
    try {

      Response response = await get(
          Uri.parse(
              'https://api.timezonedb.com/v2.1/get-time-zone?key=8L8B01GRIX05&format=json&by=position&lat=$dstOffset&lng=$rawOffset'));

      Map data = jsonDecode(response.body);
      print(data);
      String timezone = data['zoneName'];
      List cityname = timezone.split("/");
      String realcity = cityname[1];
      city = realcity;
      timez = timezone;
    }
    catch (e){
      print(e);
    }



  }

  Future <void> _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }


  void setwordlTime() async {

    await realloation();
    worldtime response = worldtime(
        location: "$city", flagimg: "sds", url: "$timez");
    await response.getTime();
    timez = response.time;
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //
    //   'location': response.location,
    //   'flagimg': response.flagimg,
    //   'time': response.time
    // });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "time -$timez",
                    style:TextStyle(
                      fontSize: 20.0,
                    ),
            ),
            SizedBox(height: 20.0),
            Text(
              "$city",
              style:TextStyle(
                fontSize: 20.0,
              ),
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                setwordlTime();
              },
            ),
          ],
        ),
      ),
    );
  }




}

