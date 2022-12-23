import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/Screens/ChatScreen.dart';

import 'TrackingScreen.dart';
class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              //AppBar
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: Color(0xFF555555)
                        )
                    )
                ),
                child: Material(
                  // elevation: 3,
                  color: Colors.white,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //back bt
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 7.5,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new Image.asset("assets/Icons/ic_back.png",width: 22,),
                          ),
                        ),
                      ),
                      //Center Widget
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Order Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'narrowmedium',
                            ),),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 2,
                        child:InkWell(
                          onTap: (){
                            _showPopupMenu(context);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new Image.asset("assets/Icons/ic_option.png",width: 20,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              Expanded(
                child: Stack(
                  children: [
                    //Pink box
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pink,
                    ),

                    //
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 100,
                      child: SizedBox(
                        child: Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 20.0,right: 20,top: 30,bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Order Id
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Order ID: 34122122516638",
                                      style: TextStyle(
                                        color: Color(0xFF787878),
                                        fontSize: 13,
                                        fontFamily: "narrowmedium",
                                      ),),
                                  ),
                                  //
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/Icons/ic_date.png",width: 22,),
                                                SizedBox(width: 8,),
                                                Container(
                                                  padding: EdgeInsets.only(top: 3),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("Pickup Date",
                                                          style: TextStyle(
                                                            color: Color(0xFF787878),
                                                            fontSize: 13,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                      Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("2020-04-16",
                                                          style: TextStyle(
                                                            color: Color(0xFFC2C2C2),
                                                            fontSize: 13,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/Icons/ic_time.png",width: 22,),
                                                SizedBox(width: 8,),
                                                Container(
                                                  padding: EdgeInsets.only(top: 3),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("Pickup Time Sl...",
                                                          style: TextStyle(
                                                            color: Color(0xFF787878),
                                                            fontSize: 13,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                      Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("09:00 - 18:00",
                                                          style: TextStyle(
                                                            color: Color(0xFFC2C2C2),
                                                            fontSize: 13,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset("assets/Icons/ic_avatar.png",width: 22,),
                                              SizedBox(width: 8,),
                                              Container(
                                                padding: EdgeInsets.only(top: 3),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text("To",
                                                        style: TextStyle(
                                                          color: Color(0xFF787878),
                                                          fontSize: 13,
                                                          fontFamily: "narrowmedium",
                                                        ),),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text("jhone alexed",
                                                        style: TextStyle(
                                                          color: Color(0xFFC2C2C2),
                                                          fontSize: 13,
                                                          fontFamily: "narrowmedium",
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 48,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.of(context).push(_trackingScreenRoute());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                              ),
                              color: Colors.pink,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              elevation: 0,
                              highlightElevation: 0,
                              child: Text(
                                "Track Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'narrowmedium'
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

//_showPopupMenu

  void _showPopupMenu(BuildContext context)
  {
    showMenu<String>(
        context: context,
        position: new RelativeRect.fromLTRB(120.0, 65.0, 22.0, 100.0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            height: 40,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(_chatScreenRoute());
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 35,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,),
                child: Text(Option.choices[0],
                  maxLines: 1,
                  style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 13,
                      fontFamily: "narrowmedium"
                  ),),
              ),
            ),
          ),
        ]
    );
  }

  //_trackingScreenRoute
  Route _trackingScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TrackingScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve),);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  //_chatScreenRoute
  Route _chatScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve),);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
class Option{
  static const String Report = "Report a Problem";
  static const List<String> choices = <String>[
    Report,
  ];
}