import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ChatScreen.dart';
class TrackingScreen extends StatefulWidget {
  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  void initState(){
    getCustomMarker();
    super.initState();
  }
  BitmapDescriptor customMarker;

  getCustomMarker() async{
    customMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/icons/ic_current_location.png");
  }

  Completer<GoogleMapController> _controller1 = Completer();
  LatLng currentLocation = LatLng(32.940548,73.727631);
  Widget _googleMap(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 14.0,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          minMaxZoomPreference: MinMaxZoomPreference(12,18.6),
          markers:{
            Marker(
                markerId: MarkerId("1"),
                position: currentLocation,
                //    infoWindow: InfoWindow(title: ""),
                icon: customMarker
            )
          }
      ),
    );
  }

  //
   List<Orderdata> orderList =[
      Orderdata(img: "assets/Icons/ic_pink_tick.png",title: "Order Created",subTitle: "Your order has been placed",timeIndicator: "02:57 PM"),
      Orderdata(img: "assets/Icons/ic_pink_tick.png",title: "On the way to pickup location",subTitle: "Rider is going to pickup your order",timeIndicator: "03:22 PM"),
      Orderdata(img: "assets/Icons/ic_pink_circle.png",title: "Order Picked",subTitle: "Your order has been picked up",timeIndicator: "04:34 PM"),
      Orderdata(img:"assets/Icons/ic_pink_circle.png",title: "On the way to dropoff location",subTitle: "Rider is going to dropoff location",timeIndicator: ""),
      Orderdata(img: "assets/Icons/ic_grey_circle.png",title: "Order Delivered",subTitle: "Your order has been delivered",timeIndicator: ""),
   ];
   ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: <Widget>[
          //Map
          _googleMap(),
          Container(
            child: Column(
              children: <Widget>[
                // SizedBox(
                //   height: 28,
                // ),
                // AppBar
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //back bt
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 11,
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
                          child: Text("Tracking",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'narrowmedium',
                            ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.6,
              expand: true,
              builder: (BuildContext context, ScrollController scrollController){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 45,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0x80C2C2C2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ), //
                      Container(
                        height: 63,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color(0x80C2C2C2)
                              )
                          ),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            //img
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      // fit: BoxFit.fill,
                                      image:  AssetImage("assets/Icons/ic_profile.png",),
                                    )
                                ),
                              ),
                            ),
                            //title
                            Positioned(
                              left: 60,
                              top: 13,
                              child: Container(
                                  child:Text("John Jones",
                                    style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontSize: 13,
                                      fontFamily: "narrowmedium",
                                    ),)
                              ),
                            ),
                            //subTitle
                            Positioned(
                              left: 60,
                              top: 32,
                              child: Container(
                                  child:Text("Zippykind",
                                    style: TextStyle(
                                      color: Color(0xFFC2C2C2),
                                      fontSize: 13,
                                      fontFamily: "narrowmedium",
                                    ),)
                              ),
                            ),
                            //call
                            Positioned(
                              right: 30,
                              top: 0,
                              bottom: 0,
                              child: Image.asset("assets/Icons/ic_pink_phone.png",scale: 3.4,),
                            ),
                            //text
                            Positioned(
                              right: -18,
                              top: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(_chatScreenRoute());
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/Icons/ic_chat.png",scale: 2.8,),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      //
                      ListView.builder(
                          itemCount: orderList.length,
                          controller: scrollController,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (BuildContext ctx,index){
                            return Container(
                              height: 55,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color(0x80C2C2C2)
                                      )
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(orderList[index].img,height: 30,),
                                      SizedBox(width: 15,),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(orderList[index].title,
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 13,
                                                  fontFamily: "narrowmedium",
                                                ),),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                                child:Text(orderList[index].subTitle,
                                                  style: TextStyle(
                                                    color: Color(0xFFC2C2C2),
                                                    fontSize: 13,
                                                    fontFamily: "narrowmedium",
                                                  ),)
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                  Container(
                                      child:Text(orderList[index].timeIndicator,
                                        style: TextStyle(
                                          color: Color(0xFFC2C2C2),
                                          fontSize: 11,
                                          fontFamily: "narrowmedium",
                                        ),)
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                );
              }),

        ],
      ),
    ));
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


class Orderdata{
  String img;
  String title;
  String subTitle;
  String timeIndicator;
  Orderdata({this.img,this.title,this.subTitle,this.timeIndicator});

}