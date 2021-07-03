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
  int checked =0;
  String location2;
  String timezone2;



  void callfuntion  ()async{

    worldtime response =  worldtime(location: "$location",flagimg: "",url: "$timezone");
    await response.getTime();
      setState(() {
        data['time'] = response.time;
      });

    print(" return time - $data['time']");
  }

  void callfuntion2  ()async{

    worldtime response =  worldtime(location: "$location2",flagimg: "",url: "$timezone2");
    await response.getTime();
    setState(() {
      data2['time'] = response.time;
    });

    print(" return time - $data2['time']");
  }


  @override
  void initState()  {
    // TODO: implement initState
    Timer mytimer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(()  {
           callfuntion();
           checked != 0?
        callfuntion2():null;

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    //chcek if data varibal is not empty if empty get data from loading page.if varival is not empty show data varibale
    data = data.isNotEmpty?data : ModalRoute.of(context).settings.arguments;
    image = data['isDayTime']? 'day.jpg':'night.jpg' ;
    location =data['location'];

    timezone =data['url'] ;
    Color bgcolor =data['isDayTime']?Colors.orange[600] : Colors.black54;

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
                       data2 = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flagimg': result['flagimg'],
                        'url':result['url'],
                      };

                      location2 =data2['location'];
                      timezone2 =data2['url'] ;

                      checked +=1;



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

              ),

              SizedBox(height: 40),
              //Check if new location select or not
              if(checked >0)

                condition(data2)

            ],



          ),
      ),
        ),

      ),
    );
  }
}


Widget condition(data2) {
  String img = data2['isDayTime']? 'day.jpg':'night.jpg' ;
  return Card(

        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/$img"),
            fit: BoxFit.cover,

            ),
            ),
        child:
          Column(
              children: <Widget> [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(data2['location'],
        style: TextStyle(
          fontSize: 18.0,
          letterSpacing: 2.0,
          color: Colors.black54,
        ),
      ),
        ]),
        SizedBox(height: 20),
        Text(data2['time'],
        style: TextStyle(
        fontSize: 36.0,
        color: Colors.black54,
  ),

  )

      ]),
  ));



}
