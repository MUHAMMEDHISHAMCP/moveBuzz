import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map/plugin_api.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/src/layer/marker_layer.dart' as Marker;
import 'package:latlong/latlong.dart' as latlng;

class ShowMapScreen extends StatefulWidget {
  const ShowMapScreen({Key key}) : super(key: key);

  @override
  State<ShowMapScreen> createState() => _ShowMapScreenState();
}

class _ShowMapScreenState extends State<ShowMapScreen> {
  MapController mapVController;
  

  @override
  Widget build(BuildContext context) {
   latlng.LatLng point = latlng.LatLng(49.5, -0.09);
    return Stack(
      children: [FlutterMap(options: MapOptions(
        onTap: (pt) {
        setState(() {
          print(point);
          point = pt;
        });
        },
       zoom: 10.0,
       controller:mapVController 


      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a','b','c'],
        ),
        MarkerLayerOptions(
          markers: [
           Marker.Marker(
            height: 100.0,
            width: 100.0,
           point: point,
            builder: (ctx) {
              print('object');
              Icon(
              Icons.location_on,color: Colors.red,size: 40,
            );
            }
           )
          ]
      )
     
      ],)],
    );
  }
}