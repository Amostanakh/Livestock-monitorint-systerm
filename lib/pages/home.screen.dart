import 'dart:async';
import 'package:flutter/material.dart';
import 'package:livestock_sms/widgets/inputs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    CameraPosition initialPosition =
        const CameraPosition(target: LatLng(26.8206, 30.8025));
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

    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text('LiveStock Names'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: initialPosition,
            zoomControlsEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: onMapTypeButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: const Color(0xFF8FA93A),
                child: const Icon(Icons.map, size: 30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
