import 'package:flutter/cupertino.dart';
import 'dart:math' as mathdart;
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mb;

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var token = "pk.eyJ1IjoicmVuYW50YTk5IiwiYSI6ImNrandneDBvYjBpbHYydnF1NTgzazVkczQifQ.I1WqOUVssNk07wcp5HjD5w";

  mb.MapboxMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            buildMap(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      height: 400,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: "mapbox://styles/mapbox/streets-v11",
        initialCameraPosition: new mb.CameraPosition(
          target: mb.LatLng(-8.1721345,113.7037796),
          zoom: 8,
        ),
        onMapCreated: mapCreated,
        onMapClick: mapClicked,
      ),
    );
  }


  void mapClicked(mathdart.Point<double> point, mb.LatLng lating) {
    print('lat lng clicked: ${lating.latitude},${lating.longitude}');
    if (mapController != null) {
      mapController.addCircle(
        new mb.CircleOptions(
          circleRadius: 8,
          circleColor: 'red',
          circleOpacity: 1,
          geometry: lating,
          draggable: false,
        ),
      );
    }
  }

  void mapCreated(mb.MapboxMapController controller) {
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-8.1721345,113.7037796);

    mapController.addCircle(new mb.CircleOptions(
      circleRadius: 8,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));
  }

}
