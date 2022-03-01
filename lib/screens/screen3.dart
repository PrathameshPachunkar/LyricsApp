import 'package:flutter/material.dart';
import 'package:musiclyrics/network%20helper.dart';


class Screen3 extends StatefulWidget {
  late int trackid;


  Screen3(this.trackid);

  @override
  _Screen3State createState() => _Screen3State();
}
class _Screen3State extends State<Screen3> {
 @override
 late String lyrics;
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  void getdata()async{
   Screen_3_data data = Screen_3_data(widget.trackid);
   await data.getdatascreen3();
   print(data.lyrics);
   setState(() {
     lyrics = data.lyrics;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(child: Text(lyrics,style: TextStyle(color: Colors.black,fontSize: 30),),),
      )
    );
  }
}
