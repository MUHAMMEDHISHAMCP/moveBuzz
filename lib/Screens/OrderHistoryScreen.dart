import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/Screens/MyDrawer.dart';
import 'package:go_delivery/Screens/MapScreen.dart';
import 'OrderDetailsScreen.dart';
class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  bool popMenu = false;
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context)=>MapScreen()
        ), (route) => false);
      },
      child: SafeArea(child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          key: mainDrawerKey,
          drawer: MyDrawer(),
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
                          left: 9,
                          child: InkWell(
                            onTap: (){
                              mainDrawerKey.currentState.openDrawer();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: new Image.asset("assets/Icons/ic_menu.png",width: 25,),
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
                            child: Text("Order History",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'narrowmedium',
                              ),),
                          ),
                        ),
                        //Menu button
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 3,
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
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 0
                    ),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext, index){
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(_orderDetailsScreenRoute());
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              height: 70,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color(0x80C2C2C2)
                                      )
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Order # 009658120",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "narrowmedium",
                                            color: Color(0xFF787878),
                                          ),),
                                      ),
                                      Container(
                                        child: Text("28 Oct 2020",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "narrowmedium",
                                            color: Color(0xFFC2C2C2),
                                          ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Container(
                                    width: 50,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      // borderRadius: BorderRadius.circular(4)
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("Pickup",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "narrowmedium",
                                        color: Colors.white,
                                      ),),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
  void _showPopupMenu3(BuildContext context)
  {
    showMenu<String>(
      context: context,
      position: new RelativeRect.fromLTRB(120.0, 65.0, 22.0, 100.0),
      items: Option.choices.map((String choice ) {
        return new PopupMenuItem<String>(
          enabled: false,
          height: 35,
          child: InkWell(
            onTap: (){

            },
            splashColor: Colors.red,
            highlightColor: Colors.red,
            child: Container(
              height: 35,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text(choice,
                style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 13,
                    fontFamily: "narrowmedium"
                ),),
            ),
          ),
          value: choice,
        );
      }).toList(),
    );
  }

  void _showPopupMenu(BuildContext context)
  {
    showMenu<String>(
      context: context,
      position: new RelativeRect.fromLTRB(120.0, 65.0, 22.0, 100.0),
      items: <PopupMenuEntry<String>>[
         PopupMenuItem<String>(
           height: 35,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 35,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10,top: 7),
              child: Text(Option.choices[0],
                style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 13,
                    fontFamily: "narrowmedium"
                ),),
            ),
          ),
        ),
        PopupMenuItem<String>(
          height: 35,
          child: InkWell(
            onTap: (){
            Navigator.pop(context);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 35,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10,bottom: 7),
              child: Text(Option.choices[1],
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








  //_orderDetailsScreenRoute
  Route _orderDetailsScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => OrderDetailsScreen(),
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
  static const String currentOrder = "Current Order";
  static const String pastOrder = "Past Order";
 static const List<String> choices = <String>[
   currentOrder,
   pastOrder
 ];
}