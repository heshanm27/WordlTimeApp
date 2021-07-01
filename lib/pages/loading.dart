import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtimeapi.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/pages/gps.dart';




class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {



void setwordlTime() async{
  worldtime response =  worldtime(location: "Colombo",flagimg: "sds",url: "Asia/Colombo");
  await response.getTime();
 Navigator.pushReplacementNamed(context, '/home',arguments: {

    'location' : response.location,
    'flagimg' : response.flagimg,
    'time':response.time

 });

}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setwordlTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[700],
      body:Center(

        child:
        Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Loading",
          style: TextStyle(

            color:Colors.amberAccent,
            fontSize: 20.0,
            letterSpacing: 2.0,


          ),
          ),
          SizedBox(height: 20.0),

          SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),




        ]

        ),
      ),


    );
  }
}
