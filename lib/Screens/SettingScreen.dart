import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/Screens/MyDrawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MapScreen.dart';
import 'package:go_delivery/main.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  bool value=false;

  var url="https://www.cookiebot.com/en/privacy-policy-generator-gdpr/?campaignid=1450827530&adgroupid=63331669624&keyword=sample+privacy+policy+for+website&gclid=Cj0KCQiA48j9BRC-ARIsAMQu3WRut4M68Xw53ZuZ4u4CFjEio7rPvPYbwV93KToDYxUaTubPYy7kSy0aAkxtEALw_wcB";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>MapScreen()
        ), (route) => false);
      },
      child:  SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        key: mainDrawerKey,
        drawer: MyDrawer(),
        body: Container(
          child: Column(
            children: [
              // SizedBox(
              //   height: 28,
              // ),
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
                          child: Text("Settings",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'narrowmedium',
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Select language
              InkWell(
                onTap: (){
                  langPopup();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Select language",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "narrowmedium",
                            ),),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Image.asset("assets/Icons/ic_translate.png",width: 24,),
                      ),
                    ],
                  ),
                ),
              ),

              //Dark Mode
              InkWell(
                onTap: (){
                  setState(() {
                    value=!value;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Dark Mode",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "narrowmedium",
                            ),),
                        ),
                      ),
                      Positioned(
                          right: -10,
                          top: 0,
                          bottom: 0,
                          child: Switch(
                            value: value,
                            onChanged: (bool val){
                              setState(() {
                                value=!value;
                              });
                            },
                          )
                      ),
                    ],
                  ),
                ),
              ),


              //Privacy Policy
              InkWell(
                onTap: () async{
                  await launch(url);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Privacy Policy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "narrowmedium",
                            ),),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Image.asset("assets/Icons/ic_info.png",width: 25,),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      )),
    );
  }
//Lang Dialoge
  void langPopup() {
    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            child: Container(
              height: 150,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: ListTile(
                      title: Container(
                        child: Text("English",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListTile(
                      title: Container(
                        child: Text("espanol",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListTile(
                      trailing: Container(
                        child: Text("العربیہ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) ;
        });
  }
}
