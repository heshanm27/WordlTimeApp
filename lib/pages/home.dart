import 'package:flutter/material.dart';



class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Map  data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(

      body: SafeArea(child: Column(

        children: <Widget> [

          FlatButton.icon(onPressed: (){
            Navigator.pushNamed(context,  '/location');
          },

              label: Text("Edit Location"),
              icon: Icon(Icons.add_location),

          ),

        ],



      ),

      ),
    );
  }
}
