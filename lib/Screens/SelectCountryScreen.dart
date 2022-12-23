import 'dart:io';
import 'package:flutter/material.dart';
class SelectCountryScreen extends StatefulWidget {
  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {

  List<String> country =[
    "Afghanistan",
    "Burkina",
    "Central African Republic",
    "Democratic Republic of the Congo",
    "Falkland Islands (Malvinas)",
    "Pakistan",
    "Srilanka",
    "Turkey",
    "Iran",
    "KSA",
    "UK",
    "USA",
    "Canada",
    "China",
    "Russia",
    "Japan",
    "South Korea",
    "North Korea",
  ];
  String text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 28,
            // ),
            // AppBar
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
                      child: Text("Select Country",
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
                    right: 8,
                    child: InkWell(
                      onTap: (){
                        _sendDataBack(context);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text("Apply",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            //Search Text Field
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Color(0x80C2C2C2)
                      )
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 8,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Color(0xFF787878),
                          fontSize: 14,
                          fontFamily: "narrowmedium",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Color(0xFFC2C2C2),
                            fontSize: 14,
                            fontFamily: "narrownews",
                          ),

                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "narrownews",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Listview
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: country.length,
                      itemBuilder: (BuildContext ctx,index){
                        return InkWell(
                          onTap: (){
                            text = country[index];
                            Navigator.pop(context);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
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
                            alignment: Alignment.centerLeft,
                            child: Text(country[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "narrowmedium",
                              ),),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _sendDataBack(BuildContext context) {
    String textToSendBack= text;
    Navigator.pop(context, textToSendBack);
  }

}
