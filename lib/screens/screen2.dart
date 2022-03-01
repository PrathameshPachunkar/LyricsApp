import 'package:flutter/material.dart';
import 'package:musiclyrics/datamodel.dart';
import 'package:musiclyrics/network%20helper.dart';
import 'package:musiclyrics/screens/screen3.dart';

class Screen2 extends StatefulWidget {
  late int trackis;
  Screen2({required this.trackis});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
 // late int trackid;
  late int rating;
  late String artist;
  late String albumname;
  late String trackname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrackdetails();
  }

  getrackdetails() async {
    screen_2_details data = screen_2_details(trackid: widget.trackis);
    await data.trackdetails();
    setState(() {
      albumname = data.albumname;
      trackname = data.trackname;
      rating = data.rating;
      //trackid = data.trackid;
      artist = data.artist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(
              child: Column(
                children: [
                  Text(
                    trackname,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Album Name:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          albumname,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Artist:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  artist,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text(
                  "Rating:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "$rating",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 50,
            child: ElevatedButton(

              onPressed: () {
                setState(() {
                  getrackdetails();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen3(widget.trackis)));
                });
              },
              child: Center(
                child: Text("LYRICS"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

