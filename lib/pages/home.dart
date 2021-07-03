import 'package:flutter/material.dart';
import 'dart:async';
import 'package:worldtime/services/worldtimeapi.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map  data = {};
  Map data2={};

  String location;
  String timezone;
  String image;
  String color;
  bool whattime;


  void callfuntion  ()async{

    worldtime response =  worldtime(location: "$location",flagimg: "",url: "$timezone");
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


      });
    });
  }
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty?data : ModalRoute.of(context).settings.arguments;
    image = data['isDayTime']? 'day.jpg':'night.jpg' ;
    location =data['location'];
    //whattime=data['isDayTime'];
    timezone =data['url'] ;
    Color bgcolor =data['isDayTime']?Colors.orange[600] : Colors.black54;
    //time = data['time'];
   // print(data);
    return Scaffold(
  backgroundColor: bgcolor,
      body: SafeArea
        (child: Container(
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/$image"),

          fit: BoxFit.cover,
          ),

        ) ,
          child: Padding(
          
          padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
          child: Column(

            children: <Widget> [
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location',arguments:

                  {
                    'isDayTime':data['isDayTime'],
                  }

                  );
                  if(result != null){
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flagimg': result['flagimg'],
                        'url':result['url'],
                      };
                      image = data['isDayTime']? 'day.jpg':'night.jpg' ;
                      location =data['location'];
                      timezone =data['url'] ;
                      Color bgcolor =data['isDayTime']?Colors.orange[600] : Colors.black54;
                    });
                  }
              },

                  label: Text("Edit Location",
                  style: TextStyle(
                    color:Colors.white,
                  ),),
                  icon: Icon(Icons.add_location
                  ,color: Colors.white,),

              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                  ),
                ],

              ),
              SizedBox(height: 20),
              Text(data['time'],
              style: TextStyle(
                fontSize: 66.0,
                color: Colors.white,
              ),

              )
            ],



          ),
      ),
        ),

      ),
    );
  }
}
