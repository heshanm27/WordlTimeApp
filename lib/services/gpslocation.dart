import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';



class gpsloation{

  Position _currentPosition;
  String timez ;
  String city;


  gpsloation({this.city,this.timez});

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

  Future <void> _getCurrentLocation()  async{
    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {

        _currentPosition = position;

    }).catchError((e) {
      print(e);
    });
  }
}