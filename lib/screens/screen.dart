import 'package:flutter/material.dart';
import 'package:musiclyrics/datamodel.dart';
import 'package:musiclyrics/screens/screen2.dart';

import '../network helper.dart';

class Screen1 extends StatefulWidget {

  // late String trackname;
  // late int trackid;
  // late String artistname;



  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late List<lyricsmodel> datalist=[];
  int page =1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();
  }
  void getdata()async{
    Trackdetails requireddata = Trackdetails(page);
    await requireddata.networkhelper();
    datalist = requireddata.data;
    //print(datalist[1].artist);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(

            items: [
          BottomNavigationBarItem(

            label: "BACK",
              icon: IconButton(
            onPressed: () {
              setState(() {
                page = page-1;
                Trackdetails(page);

                // requireddata.networkhelper(page);
                getdata();
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
          ),
          BottomNavigationBarItem(
            label: 'NEXT',
            icon: IconButton(
              onPressed: () {
                page = page+1;
                Trackdetails(page);
               // requireddata.networkhelper(page);
                getdata();
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
            ),
          ),

        ]),
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2(trackis:datalist[index].trackid,)));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                      padding: EdgeInsets.only(left: 5),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          datalist[index].trackname,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("Artists:"),
                              Expanded(
                                child: Text(
                                  datalist[index].artist,
                                  style: TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontSize: 10,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              );
            }));
  }
}
