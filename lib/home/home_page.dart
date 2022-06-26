import 'package:ev_arkadasi/filter/filter_page.dart';
import 'package:ev_arkadasi/my_rents/my_rents_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  List<bool> dailyOrConstant = List.generate(2, (index) => false);
  List<Marker> _markers = <Marker>[];
  bool isFilterOn = false;
  @override
  Widget build(BuildContext context) {
    // Haritaya Pin ekleme
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.43238, -122.08790),
        infoWindow: InfoWindow(title: 'The title of the marker'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.43538, -122.08790),
        infoWindow: InfoWindow(title: 'The title of the marker'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.43738, -122.08790),
        infoWindow: InfoWindow(title: 'The title of the marker'),
      ),
    );

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
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
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
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
