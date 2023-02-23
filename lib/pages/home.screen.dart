import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livestock_sms/config/configuring.dart';
import 'package:livestock_sms/widgets/inputs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<Position?> determinePosition() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Not Available');
    }
  } else {
    throw Exception('Error');
  }
  return await Geolocator.getCurrentPosition();
}

class _MyHomePageState extends State<MyHomePage> {
  String locationMessage = "Error occored";

  @override
  Widget build(BuildContext context) {
    Set<Marker> getNarkers() {
      return <Marker>{
        const Marker(
            markerId: MarkerId("livestock"),
            position: LatLng(-19.0169211, 29.1528018),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'livestock'))
      };
    }

    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

    void initMarker(specify, specifyId) async {
      var markerIdval = specifyId;
      final MarkerId markerId = MarkerId(markerIdval);
      final Marker marker = Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: markerId,
        position:
            LatLng(specify['location'].latitude, specify['location'].longitude),
        infoWindow: InfoWindow(title: "livestock", snippet: specify['address']),
      );
      setState(() {
        markers[markerId] = marker;
      });
    }

    getMarkData() {
      FirebaseFirestore.instance
          .collection('users')
          .doc(kUser.value?.uid)
          .collection('myLivestocks')
          .get()
          .then((livestockData) {
        if (livestockData.docs.isNotEmpty) {
          for (int i = 0; i < livestockData.docs.length; i++) {
            initMarker(livestockData.docs[i].data, livestockData.docs[i].id);
          }
        }
      });
    }

    void initState() {
      getMarkData();
      super.initState();
    }

    CameraPosition initialPosition =
        const CameraPosition(target: LatLng(-19.0169211, 29.1528018));
    Completer<GoogleMapController> _controller = Completer();

    void onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    MapType currentMapType = MapType.normal;

    void onMapTypeButtonPressed() {
      setState(() {
        currentMapType = currentMapType == MapType.normal
            ? MapType.satellite
            : MapType.normal;
      });
    }

    //
    //
    //
    //yuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuer

    Future<Position> getLoc() async {
      bool serviceEnable = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnable) {
        return Future.error('Location se');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location denied');
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Pemenetly denied');
      }
      return Geolocator.getCurrentPosition();
    }

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('LiveStock Names'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: getNarkers(),
            // markers: Set<Marker>.of(markers.values),
            onMapCreated: onMapCreated,
            initialCameraPosition: initialPosition,
            zoomControlsEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  getLoc().then((value) {
                    //  lat = '${value.latitude}';
                    // long = '${value.longitude}';
                  });
                  // determinePosition();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.orange,
                label: const Text("Get Location"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
