import 'package:ev_arkadasi/page/filter/filter_page.dart';
import 'package:ev_arkadasi/page/my_rents/my_rents_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // MAP
  GoogleMapController? _googleMapController;
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  List<Marker> _markers = <Marker>[];

  // Customize
  List<bool> dailyOrConstant = List.generate(2, (index) => false);
  bool isFilterOn = false;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Haritaya Pin ekleme
    // _markers.add();
    _markers = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.43238, -122.08790),
        infoWindow: InfoWindow(title: 'Ev 1A', snippet: "a1 a"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        onTap: () {},
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.43338, -122.08890),
        infoWindow: InfoWindow(title: 'Ev 2B'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: ToggleButtons(
          isSelected: dailyOrConstant,
          children: [
            // TODO: Bunu Yap : https://stackoverflow.com/questions/65879501/how-to-create-a-toggle-switch-button-in-flutter
            Text("Günlük"),
            Text("Kalıcı"),
          ],
          onPressed: (index) {
            dailyOrConstant = List.generate(2, (index) => false);
            setState(() {
              dailyOrConstant[index] = true;
            });
          },
        ),
      ),
      drawer: myDrawer(),
      body: SafeArea(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          // zoomGesturesEnabled: false,
          // mapType: MapType.normal,
          initialCameraPosition: _initialCameraPosition,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;

            _googleMapController?.showMarkerInfoWindow(const MarkerId("1"));
            _googleMapController?.showMarkerInfoWindow(const MarkerId("2"));
          },
        ),
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[],
        //   ),
        // ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Switch(
                value: isFilterOn,
                onChanged: (value) {
                  setState(() {
                    isFilterOn = !isFilterOn;
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              FloatingActionButton(
                heroTag: "1",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterPage(),
                    ),
                  );
                },
                tooltip: 'Increment',
                child: const Icon(Icons.sort),
              ),
            ],
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () async {
              _googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(_initialCameraPosition));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Drawer myDrawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Placeholder(
                  fallbackWidth: 50,
                  fallbackHeight: 50,
                ),
                Text('Ad Soyad'),
                Text('Tel: 555 111 22 33'),
              ],
            ),
          ),
          ListTile(
            title: const Text('İlan oluştur'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('İlanlarım'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyRentsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Favorilerim'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Mesajlarım'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
