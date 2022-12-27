
import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_delivery/utils/string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:location/location.dart';
import 'DeliveryDetailsScreen.dart';
import 'MyDrawer.dart';
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();

  ///////////////////////
  LatLng currentLocation = LatLng(32.940548,73.727631);

  Completer<GoogleMapController> _controller2 = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller2.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    currentLocation = position.target;
  }
  Widget googleMap(BuildContext context){
    return   Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition:
        CameraPosition(
          target: currentLocation,
          zoom: 12.0,),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        onCameraMove: _onCameraMove,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
      ),
    );
  }
   String fromAdress ;
   String fromAdress2;
   String toAdress ;
  final  fromAdressController = TextEditingController();
   final  fromAdressController2 = TextEditingController();
   final  toAdressController = TextEditingController();
  bool pickupIcon = true;
  //PickUp
  Widget pickupScreen(){
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Top Widgets
              Container(
                child: Column(
                  children: <Widget>[
                    //Menu Button
                    Container(
                      height: 55,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () async{
                        
                              
                                mainDrawerKey.currentState.openDrawer();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset("assets/Icons/ic_menu.png",
                                  color: Colors.black,
                                  width: 25,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Location Indicator
                    Container(
                      padding: EdgeInsets.only(left: 16.0,right: 20,top: 5),
                      child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Image.asset("assets/Icons/ic_circle.png",
                                    color: Colors.pink,height: 18,),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(fromAdress ??"Confirm PickUp Adress",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                            color: Color(0xFF787878),
                                            fontSize: 12,
                                            fontFamily: 'narrowmedium',
                                          ),),
                                      ),
                                      SizedBox(height: 3,),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("701 Treeside Ct,  Chesterfield, St Louis 63017",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 12,
                                            fontFamily: 'narrowmedium',
                                          ),),
                                          // child: Text(fromAdress2??' ',
                                          // maxLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                          // softWrap: false,
                                          // style: TextStyle(
                                          //   color: Color(0xFFC2C2C2),
                                          //   fontSize: 12,
                                          //   fontFamily: 'narrowmedium',
                                          // ),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),

              //Bottom Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 22,horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    //Car Delivery button
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                                height: 52,
                                color: Colors.white,
                                elevation: 0,
                                highlightElevation: 0,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0)
                                ),
                                onPressed: (){
                                  //   cardeliverPopup();
                                  deliveryPopup();
                                },
                                child:Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            child: Image.asset("assets/Icons/ic_delivery.png",
                                              width: 35,
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          Container(
                                            child: Text(value==null?"Delivery":"$value",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontFamily: 'narrowmedium',
                                              ),),
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Image.asset("assets/Icons/ic_drop_arrow.png",
                                          scale: 5.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    //Confirm Pickup button
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                              height: 48,
                              elevation: 0,
                              highlightElevation: 0,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              color: Colors.pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0)
                              ),
                              onPressed: (){
                                setState(() {
                                  
                                });
                                confirmPickupPopup(context);
                              },
                              child:Text("Confirm Pickup",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  fontFamily: 'narrowmedium',
                                ),)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Map pickupIcon
          GestureDetector(
            onTap: () async {
              Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

_locationData = await location.getLocation();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: pickupIcon,
                    child: Image.asset("assets/Icons/ic_location_pickup.png",scale: 4.5,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool dropoffIcon = true;
//dropOff
  Widget dropOff(){
    return  Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Top Widgets
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
                               // Navigator.pop(context);
                                setState(() {
                                  dropoff=false;
                                  pickup=true;
                                });
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
                              child: Text("Select Dropoff Location",
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
                    //    Location Indicator
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                      child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/Icons/ic_circle.png",
                                        color: Colors.pink,height: 15,),
                                      Container(
                                        height: 35,
                                        width: 1,
                                        margin: EdgeInsets.only(top:2,bottom: 3),
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                      ),
                                      Container(
                                        width: 13,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            shape: BoxShape.circle
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 4,bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(fromAdress ?? "No Adress",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Color(0xFF787878),
                                                    fontSize: 12,
                                                    fontFamily: 'narrowmedium',
                                                  ),),
                                              ),
                                              SizedBox(height: 3,),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text("701 Treeside Ct,  Chesterfield, St Louis 63017",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Color(0xFFC2C2C2),
                                                    fontSize: 12,
                                                    fontFamily: 'narrowmedium',
                                                  ),),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(height: 1, color: Color(0x80C2C2C2),thickness: 1,),
                                        Container(
                                          height: 35,
                                          child: Column(
                                            children: [
                                                 Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(toAdress ?? "Confirm Dropoff Adress",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Color(0xFF787878),
                                                    fontSize: 12,
                                                    fontFamily: 'narrowmedium',
                                                  ),),
                                              ),
                                              SizedBox(height: 3,),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text("789 E Parkway, Apt A, Louisville, KY - 60319",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Color(0xFFC2C2C2),
                                                    fontSize: 12,
                                                    fontFamily: 'narrowmedium',
                                                  ),),
                                              ),
                                              // Stack(
                                              //   children: [
                                              //     Container(
                                              //       padding: EdgeInsets.only(right: 23),
                                              //       child: TextFormField(
                                              //         controller: toAdressController,
                                              //         cursorColor: Colors.pink,
                                              //         decoration: InputDecoration(
                                              //           contentPadding: EdgeInsets.only(bottom:15,left: 4),
                                              //           border: InputBorder.none,
                                              //           hintText: "Add dropoff Location",
                                              //           hintStyle: TextStyle(
                                              //             color: Color(0xFFC2C2C2),
                                              //             fontSize: 12,
                                              //             fontFamily: 'narrowmedium',
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //           Container(
                                              //       alignment: Alignment.centerLeft,
                                              //       child: Text("856 Treeside Ct,  Chesterfield, St Louis 63017",
                                              //         maxLines: 1,
                                              //         overflow: TextOverflow.ellipsis,
                                              //         softWrap: false,
                                              //         style: TextStyle(
                                              //           color: Color(0xFFC2C2C2),
                                              //           fontSize: 12,
                                              //           fontFamily: 'narrowmedium',
                                              //         ),),
                                              //     ),
                                              //     // Positioned(
                                              //     //   bottom: 8,
                                              //     //   right: 0,
                                              //     //   child: InkWell(
                                              //     //     onTap: (){
                                              //     //     },
                                              //     //     splashColor: Colors.transparent,
                                              //     //     highlightColor: Colors.transparent,
                                              //     //     child: Image.asset("assets/Icons/ic_search.png",scale: 4.3,),
                                              //     //   ),
                                              //     // )
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),


              //Confirm Dropoff button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                          height: 48,
                          elevation: 0,
                          highlightElevation: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)
                          ),
                          onPressed: (){
                            confirmDropoffPopup(context);
                          },
                          child:Text("Confirm Dropoff",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'narrowmedium'
                            ),)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Map dropoffIcon
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: dropoffIcon,
                  child: Image.asset("assets/Icons/ic_location_dropoff.png",scale: 4.5,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Get Started
   Widget getStarted(){
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Top Widgets
          Container(
            child: Column(
              children: <Widget>[
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
                          //  Navigator.pop(context);
                            setState(() {
                              dropoff=true;
                              getStart=false;
                            });
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
                          child: Text("Get Started",
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
                //    Location Indicator
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                  child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/Icons/ic_circle.png",
                                    color: Colors.pink,height: 15,),
                                  Container(
                                    height: 35,
                                    width: 1,
                                    margin: EdgeInsets.only(top:2,bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                  ),
                                  Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 4,bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(fromAdress ?? "sdjhkl",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Color(0xFF787878),
                                                fontSize: 12,
                                                fontFamily: 'narrowmedium',
                                              ),),
                                          ),
                                          SizedBox(height: 3,),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            // child: Text("W Canal Rd, Faisalabad, Punjab, Pakistan",
                                            child: Text("701 Treeside Ct,  Chesterfield, St Louis 63017",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 12,
                                                fontFamily: 'narrowmedium',
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(height: 1, color: Color(0x80C2C2C2),thickness: 1,),
                                    Container(
                                      height: 35,
                                      child: Column(
                                        children: [
                                           Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(toAdress ?? "sdjhkl",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Color(0xFF787878),
                                                fontSize: 12,
                                                fontFamily: 'narrowmedium',
                                              ),),
                                          ),
                                          SizedBox(height: 3,),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            // child: Text("W Canal Rd, Faisalabad, Punjab, Pakistan",
                                            child: Text("789 E Parkway, Apt A, Louisville, KY - 60319",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 12,
                                                fontFamily: 'narrowmedium',
                                              ),),
                                          ),
                                          // Stack(
                                          //   children: [
                                          //     Container(
                                          //       padding: EdgeInsets.only(right: 23),
                                          //       child: TextFormField(
                                          //         cursorColor: Colors.pink,
                                          //         decoration: InputDecoration(
                                          //           contentPadding: EdgeInsets.only(bottom:15,left: 4),
                                          //           border: InputBorder.none,
                                          //           hintText: toAdressController.text ?? "Add dropoff Location",
                                          //           hintStyle: TextStyle(
                                          //             color:  Color(0xFF787878),
                                          //             fontSize: 12,
                                          //             fontFamily: 'narrowmedium',
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Positioned(
                                          //       bottom: 8,
                                          //       right: 0,
                                          //       child: InkWell(
                                          //         onTap: (){
                                          //         },
                                          //         splashColor: Colors.transparent,
                                          //         highlightColor: Colors.transparent,
                                          //         child: Image.asset("assets/Icons/ic_search.png",scale: 4.3,),
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),


          //Confirm Started button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                      height: 48,
                      elevation: 0,
                      highlightElevation: 0,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)
                      ),
                      onPressed: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.of(context).push(_DeliveryDetailsScreenRoute());
                      },
                      child:Text("Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'narrowmedium'
                        ),)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
   }
  String value;

  bool pickup  = true;
  bool dropoff  = false;
  bool getStart  = false;


  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      key: mainDrawerKey,
      drawer: MyDrawer(),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // SizedBox(
          //   height: 28,
          // ),
          //Map
          googleMap(context),
          Visibility(
              visible: pickup,
              child: pickupScreen()
          ),
          Visibility(
              visible: dropoff,
              child: dropOff()
          ),
          Visibility(
              visible: getStart,
              child: getStarted()
          ),
          //
        ],
      ),

    ));

  }
  //deliveryPopup

  List<MyConstClass> myList=[
    MyConstClass(img: "assets/Icons/ic_delivery_car.png",title: "Car Delivery",subtitle: "Pickup and Delivery Package in a Car"),
    MyConstClass(img: "assets/Icons/ic_delivery_bike.png",title: "Delivery",subtitle: "Pickup and Delivery through bike"),
    MyConstClass(img: "assets/Icons/ic_delivery_cargo.png",title: "Pickup",subtitle: "Order pickup and deliver big luggage"),
  ];
  void deliveryPopup() async{
    final result= await  showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context){
          return  Container(
            constraints: BoxConstraints(
                minHeight: 50,
                maxHeight: 235
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                )
            ),
            child: Column(
              children: <Widget>[
                //Top
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                ),
                SizedBox(height: 8,),
                Container(
                  height: 180,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (BuildContext context,index){
                      return InkWell(
                        onTap: (){
                          String textToSendBack = myList[index].title;
                          Navigator.pop(context, textToSendBack);
                        },
                        child:  Container(
                          height: 60,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                  myList[index].img,
                                  width: 35,
                                ),
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(myList[index].title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'narrowmedium',
                                      ),),
                                  ),
                                  SizedBox(height: 4,),
                                  Container(
                                    child: Text(myList[index].subtitle,
                                      style: TextStyle(
                                        color: Color(0xFFC2C2C2),
                                        fontSize: 11,
                                        fontFamily: 'narrowmedium',
                                      ),),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
    setState(() {
      value=result;
    });
  }


  FocusNode _focusNode = FocusNode();
  //Confirm Pickup Popup
  void confirmPickupPopup(BuildContext context){
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            body:   Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height*1.0,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 220,
                      margin: EdgeInsets.only(bottom: bottom),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13)
                          )
                      ),
                      child:  ListView(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              //Top
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                              ),
                              //Any More Text Widget
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Any More Address details?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'narrowmedium',
                                  ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Container(
                            child: Column(
                              children: [
                                //TextField
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0x80C2C2C2)
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: fromAdressController,
                                    cursorColor: Colors.pink,
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Apartment #, Building Name",
                                        hintStyle: TextStyle(
                                          color: Color(0xFFC2C2C2),
                                            fontSize: 14,
                                            fontFamily: 'narrownews',
                                        )
                                    ),
                                  ),
                                ),
                                //Skip And Continue button
                                Container(
                                  padding: EdgeInsets.only(top: 30,bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ButtonTheme(
                                          height: 42,
                                          child: SizedBox(),
                                          // child: OutlineButton(
                                          //   onPressed: (){
                                          //     Navigator.of(context).pop();
                                          //     setState(() {
                                          //       dropoff=true;
                                          //       pickup=false;
                                          //     });
                                          //   },
                                          //   borderSide: BorderSide(
                                          //       color: Colors.pink,
                                          //       width: 1
                                          //   ),
                                          //   shape: RoundedRectangleBorder(
                                          //       borderRadius: BorderRadius.circular(2)
                                          //   ),
                                          //   splashColor: Colors.transparent,
                                          //   highlightColor: Colors.transparent,
                                          //   child: Text("Skip",
                                          //     style: TextStyle(
                                          //         color: Colors.pink,
                                          //         fontSize: 13,
                                          //         fontFamily: "narrowmedium",
                                          //     ),),
                                          // ),
                                        ),
                                      ),
                                      SizedBox(width: 13,),
                                      Expanded(
                                        child: MaterialButton(
                                          height: 42,
                                          onPressed: (){
                                            print(fromAdressController2.text);
                                            log(fromAdressController2.text.toString());
                                            Navigator.of(context).pop();
                                            //Navigator.of(context).push(_selectDropOffLocationScreenRoute());
                                            setState(() {
                                              fromAdress = fromAdressController.text;
                                              dropoff=true;
                                              pickup=false;
                                            });
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                          elevation: 0,
                                          highlightElevation: 0,
                                          color: Colors.pink,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Text("Continue",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'narrowmedium',
                                            ),),
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
                   Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ),
          );
        });
  }

  ///SelectDropOff
//confirmDropoffPopup
  void confirmDropoffPopup(BuildContext context){
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            body:   Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height*1.0,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 220,
                      margin: EdgeInsets.only(bottom: bottom),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13)
                          )
                      ),
                      child:  ListView(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              //Top
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                              ),
                              //Any More Text Widget
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("Any More Address details?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'narrowmedium',
                                  ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //TextField
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0x80C2C2C2)
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: toAdressController,
                                    cursorColor: Colors.pink,
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Apartment #, Building Name",
                                        hintStyle: TextStyle(
                                          color: Color(0xFFC2C2C2),
                                          fontSize: 14,
                                          fontFamily: 'narrownews',
                                        )
                                    ),
                                  ),
                                ),
                                //Skip And Continue button
                                Container(
                                  padding: EdgeInsets.only(top: 30,bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ButtonTheme(
                                          height: 42,
                                          // child: OutlineButton(
                                          //   onPressed: (){
                                          //     Navigator.of(context).pop();
                                          //     //  Navigator.of(context).push(_gerStartedScreenRoute());
                                          //     setState(() {
                                          //       dropoff=false;
                                          //       getStart=true;
                                          //     });
                                          //   },
                                          //   borderSide: BorderSide(
                                          //       color: Colors.pink,
                                          //       width: 1
                                          //   ),
                                          //   shape: RoundedRectangleBorder(
                                          //       borderRadius: BorderRadius.circular(2)
                                          //   ),
                                          //   splashColor: Colors.transparent,
                                          //   highlightColor: Colors.transparent,
                                          //   child: Text("Skip",
                                          //     style: TextStyle(
                                          //       color: Colors.pink,
                                          //       fontSize: 13,
                                          //       fontFamily: "narrowmedium",
                                          //     ),),
                                          // ),
                                          child: SizedBox(),
                                        ),
                                      ),
                                      SizedBox(width: 13,),
                                      Expanded(
                                        child: MaterialButton(
                                          height: 42,
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                            //  Navigator.of(context).push(_gerStartedScreenRoute());
                                            setState(() {
                                              toAdress = toAdressController.text;
                                              dropoff=false;
                                              getStart=true;
                                            });
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                          elevation: 0,
                                          highlightElevation: 0,
                                          color: Colors.pink,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Text("Continue",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'narrowmedium',
                                            ),),
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
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ),
          );
        });
  }

//GetStarted
  //_DeliveryDetailsScreenRoute
  Route _DeliveryDetailsScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DeliveryDetailsScreen(),
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

class MyConstClass{
  String img;
  String title;
  String subtitle;

  MyConstClass({this.img,this.title,this.subtitle});
}