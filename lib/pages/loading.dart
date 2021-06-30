import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtimeapi.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {



void setwordlTime() async{
  worldtime response =  worldtime(location: "Asia",flagimg: "sds",url: "Asia/Colombo");
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

      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text("Loading"),
      ),


    );
  }
}
