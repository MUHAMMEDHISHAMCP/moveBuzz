import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/Screens/TrackingScreen.dart';
import 'package:go_delivery/utils/string.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MapScreen.dart';

class ProceedScreen extends StatefulWidget {
  @override
  _ProceedScreenState createState() => _ProceedScreenState();
}

class _ProceedScreenState extends State<ProceedScreen> {
  DateTime _currentdate = new DateTime.now();
  bool visible = false;
  var now = new DateTime.now();
  Future<void> dfung(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _currentdate)
      setState(() {
        _currentdate = picked;
        visible = true;
      });
  }

  String senderName;
  String senderNo;
  String receiverName;
  String receiverNo;

  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    final String senderNamepref = pref.getString(KStrings.senderName);
    final String senderNopref = pref.getString(KStrings.senderPhoneNo);
    final String receiverNamepref = pref.getString(KStrings.receiverName);
    final String receiverNopref = pref.getString(KStrings.receiverPhoneNo);
    setState(() {
      senderName = senderNamepref;
      senderNo = senderNopref;
      receiverName = receiverNamepref;
      receiverNo = receiverNopref;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    String _formatdate = new DateFormat('EEEE, MMM yy').format(_currentdate);
    String formattedTime = DateFormat('KK:mm a').format(now);
    return SafeArea(
        child: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        bottom:
                            BorderSide(width: 0.5, color: Color(0xFF555555)))),
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
                        left: 8,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new Image.asset(
                              "assets/Icons/ic_back.png",
                              width: 22,
                            ),
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
                          child: Text(
                            "Delivery Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'narrowmedium',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: bottom),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                            maxHeight: viewportConstraints.maxHeight),
                        child: ListView(
                          children: <Widget>[
                            //Sender Section
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  // Delivery
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 7),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          left: -13,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_delivery.png",
                                            scale: 2.3,
                                          ),
                                        ),
                                        Positioned(
                                          left: 40,
                                          top: 0,
                                          bottom: 0,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Delivery",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "narrowmedium",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Sender
                                  Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 8),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Sender",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "narrowmedium",
                                      ),
                                    ),
                                  ),

                                  // Name
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/Icons/ic_user.png",
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 12.5,
                                        ),
                                        Container(
                                          child: Text(
                                            senderName ?? 'Name not Available',
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Phone Number
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              "assets/Icons/ic_phone.png",
                                              width: 22,
                                            )),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          child: Text(
                                            senderNo ?? "Number Not available",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //location
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/Icons/ic_location.png",
                                          width: 22,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Text(
                                            "Chester Field Apartments \n"
                                            "701 Treeside Ct,  Chesterfield, St Louis 63017",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              height: 1.4,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Pickup date and  time
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      dfung(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/Icons/ic_calendar.png",
                                                width: 22,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.8 -
                                                    5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Select pickup date & time",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF787878),
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "narrowmedium",
                                                            ),
                                                          ),
                                                        ),
                                                        Image.asset(
                                                          "assets/Icons/ic_info.png",
                                                          width: 18,
                                                        )
                                                      ],
                                                    ),
                                                    Visibility(
                                                      visible: visible,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                "$_formatdate",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF787878),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "narrowmedium",
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    "$formattedTime",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF787878),
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          "narrowmedium",
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Image.asset(
                                                                  "assets/Icons/ic_right_arrow.png",
                                                                  width: 15,
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Divider
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Divider(
                                  height: 1,
                                  color: Color(0x80C2C2C2),
                                  thickness: 1,
                                )),

                            //Receiver Section
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  // Receiver
                                  Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 8),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Receiver",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "narrowmedium",
                                      ),
                                    ),
                                  ),

                                  // Name
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/Icons/ic_user.png",
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 12.5,
                                        ),
                                        Container(
                                          child: Text(
                                            receiverName ?? 'No Name',
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Phone Number
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              "assets/Icons/ic_phone.png",
                                              width: 22,
                                            )),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          child: Text(
                                            receiverNo ??
                                                'Number Not available',
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //location
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    height: 50,
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/Icons/ic_location.png",
                                          width: 22,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Text(
                                            "Village Apartments \n"
                                            "789 E Parkway, Apt A, Louisville, KY - 60319",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              height: 1.2,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Divider
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Divider(
                                  height: 1,
                                  color: Color(0x80C2C2C2),
                                  thickness: 1,
                                )),
                            //Item Details
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  // Item Details
                                  Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 8),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Item Details",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "narrowmedium",
                                      ),
                                    ),
                                  ),
                                  //Books & Documents
                                  InkWell(
                                    onTap: () {},
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Books & Documents",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //Delivery Charges
                                  InkWell(
                                    onTap: () {},
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Delivery Charges",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\$ 0",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //Discount
                                  InkWell(
                                    onTap: () {},
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Discount",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "50%",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //Total Payment
                                  InkWell(
                                    onTap: () {},
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      height: 50,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Total Payment",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\$ 120,00",
                                                style: TextStyle(
                                                  color: Color(0xFF787878),
                                                  fontSize: 12,
                                                  fontFamily: "narrowmedium",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Divider
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Divider(
                                  height: 1,
                                  color: Color(0x80C2C2C2),
                                  thickness: 1,
                                )),

                            //last Sce
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Image.asset(
                                              "assets/Icons/ic_tag.png",
                                              width: 25,
                                            )),
                                        InkWell(
                                          onTap: () {
                                            enterPromoCodePopup();
                                          },
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 40),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor: Colors.pink,
                                              enabled: false,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(top: 3),
                                                border: InputBorder.none,
                                                hintText:
                                                    "Enter the Promo Code",
                                                hintStyle: TextStyle(
                                                  color: Color(0xFFC2C2C2),
                                                  fontSize: 12,
                                                  fontFamily: "narrownews",
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: "narrownews",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Proceed Button
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: MaterialButton(
                                            height: 48,
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MapScreen()),
                                                  (route) => false);
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            color: Colors.pink,
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            elevation: 0,
                                            highlightElevation: 0,
                                            child: Text(
                                              "Proceed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: 'narrowmedium'),
                                            ),
                                          ),
                                        ),
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
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void enterPromoCodePopup() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your Promo Code",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'narrowmedium',
                      ),
                    ),
                  ),
                  //Promo Code
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0x80C2C2C2)))),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 10,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Promo Code",
                              style: TextStyle(
                                color: Color(0xFF787878),
                                fontSize: 12,
                                fontFamily: "narrowmedium",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.pink,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                border: InputBorder.none,
                                hintText: "Enter your Promo Code",
                                hintStyle: TextStyle(
                                  color: Color(0xFFC2C2C2),
                                  fontSize: 12,
                                  fontFamily: "narrownews",
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "narrownews",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Skip And Continue button
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ButtonTheme(
                            height: 42,
                            child: SizedBox(),
                            // child: OutlineButton(
                            //   onPressed: (){
                            //     Navigator.of(context).pop();
                            //     //Navigator.of(context).push(_selectDropOffLocationScreenRoute());
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
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: MaterialButton(
                            height: 42,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            elevation: 0,
                            highlightElevation: 0,
                            color: Colors.pink,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'narrowmedium',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
