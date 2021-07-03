import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtimeapi.dart';

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {


  Map data ={};

  List<worldtime> locations = [
    worldtime(url: 'Europe/London', location: 'London', flagimg: 'uk.png'),
    worldtime(url: 'Europe/Berlin', location: 'Athens', flagimg: 'greece.png'),
    worldtime(url: 'Africa/Cairo', location: 'Cairo', flagimg: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flagimg: 'kenya.png'),
    worldtime(url: 'America/Chicago', location: 'Chicago', flagimg: 'usa.png'),
    worldtime(url: 'America/New_York', location: 'New York', flagimg: 'usa.png'),
    worldtime(url: 'Asia/Seoul', location: 'Seoul', flagimg:'south_korea.png'),
    worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flagimg: 'indonesia.png'),
  ];


  void updatetime(index) async{
    worldtime response =  locations[index];
    await response.getTime();
    Navigator.pop(context,{

      'location' : response.location,
      'flagimg' : response.flagimg,
      'time':response.time,
      'url':response.url,
      'isDayTime':response.isDayTime,

    });
    print(response.time + response.url);

  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    Color bgcolor =data['isDayTime']?Colors.orange[600] : Colors.deepPurple;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text("Locations"),
        centerTitle: true,
        elevation: 0,
      ),

      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
              child: Card(
                child: ListTile(

                  onTap: (){
                    updatetime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/flag/${locations[index].flagimg}"),
                  ),


                ),
              ),
            );

          })

    );
  }
}
