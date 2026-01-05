import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wtf_new_project/widgets/contact_item.dart';
import 'json_files.dart/locations.dart' as locations;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*late GoogleMapController mapController;
  //final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    }*/

    final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MediCall"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.search),
            ),
          ],
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(text: "Map"),
              Tab(text: "List")
            ] ),
      
            Expanded(
              child: TabBarView(children: [
                _buildMapView(context),
                
                ListView(
                  children: [
                    Column(
                      children: [
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                        ContactItem(),
                      ],
                    ),
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapView(BuildContext context) {
    return SizedBox.expand(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(target: LatLng(0, 0),
          zoom: 2)
        ),
    );
  }
}
