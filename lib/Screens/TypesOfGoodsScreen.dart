import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TypesOfGoodsScreen extends StatefulWidget {
  @override
  _TypesOfGoodsScreenState createState() => _TypesOfGoodsScreenState();
}

class _TypesOfGoodsScreenState extends State<TypesOfGoodsScreen> {
  List<String> myList = [
    "Model & Clothing",
    "Books & Documents",
    "Sports & Entertainment",
    "Accessories",
    "Car & Motorcycle Equipment",
    "Frozen food",
    "Long-lasting food",
    "Health & Beauty",
    "Electronics & Gabget equipment",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
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
                      child: Text("Type of goods",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'narrowmedium',
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 8,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        //_sendDataBack(context);
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
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 0
                ),
                child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (BuildContext, index){
                      return InkWell(
                        onTap: (){
                          Navigator.pop(context);

                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 55,
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
                          child:    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("${myList[index]}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "narrowmedium",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200
                                  ),),
                              ),
                              Visibility(
                                  visible: false,
                                  child: Image.asset("assets/Icons/ic_black_tick.png",width: 20,)
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
    ));
  }
}

