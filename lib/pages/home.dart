import 'package:flutter/material.dart';
import 'dart:async';
import 'package:worldtime/services/worldtimeapi.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map  data = {};

  String location;
  String timezone;




  void callfuntion  ()async{

    worldtime response =  worldtime(location: "$location",flagimg: "sds",url: "$timezone");
    await response.getTime();
      setState(() {
        data['time'] = response.time;
      });

    print(" return time - $data['time']");
  }




  @override
  void initState() {
    // TODO: implement initState
    Timer mytimer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
          callfuntion();
        //returntime=time;

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    location =data['location'];
    timezone =data['url'];
    //time = data['time'];
   // print(data);
    return Scaffold(

      body: SafeArea(child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(

          children: <Widget> [
            FlatButton.icon(onPressed: (){
              Navigator.pushNamed(context,  '/location');
            },

                label: Text("Edit Location"),
                icon: Icon(Icons.add_location),

            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['location'],
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
                ),
              ],

            ),
            SizedBox(height: 20),
            Text(data['time'],
            style: TextStyle(
              fontSize: 66.0,
            ),

            )
          ],



        ),
      ),

      ),
    );
  }
}
