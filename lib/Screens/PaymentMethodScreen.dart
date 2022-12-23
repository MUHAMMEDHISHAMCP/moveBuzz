import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_delivery/Screens/MyDrawer.dart';
import 'package:go_delivery/Screens/MapScreen.dart';
import 'package:intl/intl.dart';

import 'AddPaymentMethod.dart';
class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  Widget masterCard(String img){
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1,),
              Container(
                child: Text("*** *** *** 4411",
                  style: TextStyle(
                    color: Color(0xFF787878),
                      fontSize: 11,
                      fontFamily: "narrowmedium",
                  ),),
              ),
              SizedBox(height: 2,),
              Container(
                child: Text("Master Card",
                  style: TextStyle(
                    color: Color(0xFFC2C2C2),
                      fontSize: 11,
                      fontFamily: "narrowmedium",
                  ),),
              ),
            ],
          ),
          //
          Image.asset(img,width: 42,)
        ],
      ),
    );
  }
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
                              child: new Image.asset("assets/Icons/ic_menu.png",width: 22,),
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
                            child: Text("Saved Payment Methods",
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
                          right: 11,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>AddPaymentMethod()
                              ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("assets/Icons/ic_plus.png",width: 20,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                masterCard("assets/Icons/ic_american.png"),
                masterCard("assets/Icons/ic_master.png"),
                masterCard("assets/Icons/ic_visa.png"),

              ],
            ),
          ),
        ),
      )),
    );
  }
}
