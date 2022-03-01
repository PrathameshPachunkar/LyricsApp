import 'package:flutter/material.dart';
import 'package:musiclyrics/datamodel.dart';
import 'package:musiclyrics/screens/screen.dart';

import 'network helper.dart';

void main(){
  runApp(lyrics());
}
class lyrics extends StatefulWidget {
  const lyrics({Key? key}) : super(key: key);

  @override
  _lyricsState createState() => _lyricsState();
}

class _lyricsState extends State<lyrics> {
  @override
  // List<lyricsmodel> list =[];
//   getdata()async{
//     Trackdetails obj = Trackdetails();
//     list = obj.data;
//    await obj.networkhelper();
//     // print(list[0].trackname);
//   }
//   void initState() {
//     super.initState();
// getdata();
//   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

