import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtimeapi.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  //loading message
  String out = "Loading";

void setwordlTime() async{
  worldtime response =  worldtime(location: "Asia",flagimg: "sds",url: "Asia/Colombo");
  await response.getTime();
  out = response.time;//asign time value to loading message string

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
        child: Text("$out"),
      ),


    );
  }
}
