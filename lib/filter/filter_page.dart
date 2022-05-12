import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues priceRangeValues = RangeValues(1000, 10000);
  RangeValues ownerAgeValues = RangeValues(20, 80);
  int ownerGender = 0; // 1: Male, 2: Famale
  int lookingGender = 0; // 1: Male, 2: Famale, 3: Everyone
  RangeValues personCountValues = RangeValues(1, 3);
  RangeValues buildingAgeValues = RangeValues(0, 100);
  bool buildingTypeFlat = true;
  bool buildingTypeRezi = true;
  bool buildingTypeHome = true;
  RangeValues meterSquareValues = RangeValues(60, 300);
  RangeValues roomCountValues = RangeValues(0, 6);
  RangeValues hallCountValues = RangeValues(0, 3);
  RangeValues bathroomCountValues = RangeValues(0, 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _price(),
                  const Divider(),
                  _ownerGender(),
                  const Divider(),
                  _ownerAge(),
                  const Divider(),
                  _lookingGender(),
                  const Divider(),
                  _personCount(),
                  const Divider(),
                  _buildingAge(),
                  const Divider(),
                  _buildingType(),
                  const Divider(),
                  _meterSquare(),
                  const Divider(),
                  _roomsCount(),
                  const Divider(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(
          Icons.search,
          size: 32,
        ),
      ),
    );
  }

  Widget _price() {
    return ListTile(
      title: const Text("Fiyat"),
      subtitle: RangeSlider(
        values: priceRangeValues,
        min: 1000,
        max: 10000,
        divisions: 18,
        labels: RangeLabels(
          priceRangeValues.start.round().toString(),
          priceRangeValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            priceRangeValues = values;
          });
        },
      ),
    );
  }

  Widget _ownerAge() {
    return ListTile(
      title: const Text("Sahip Yaşı"),
      subtitle: RangeSlider(
        values: ownerAgeValues,
        min: 20,
        max: 80,
        divisions: 12,
        labels: RangeLabels(
          ownerAgeValues.start.round().toString(),
          ownerAgeValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            ownerAgeValues = values;
          });
        },
      ),
    );
  }

  Widget _ownerGender() {
    return ListTile(
      title: const Text("Sahip Cinsiyet"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Chip(
              label: const Text(
                "Erkek",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (ownerGender == 1) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                ownerGender = 1;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Kadın",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (ownerGender == 2) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                ownerGender = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _lookingGender() {
    return ListTile(
      title: const Text("Aranan Cinsiyet"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Chip(
              label: const Text(
                "Erkek",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (lookingGender == 1) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                lookingGender = 1;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Kadın",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (lookingGender == 2) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                lookingGender = 2;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Farketmez",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (lookingGender == 3) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                lookingGender = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _personCount() {
    return ListTile(
      title: const Text("Kalan Kişi Sayısı"),
      subtitle: RangeSlider(
        values: personCountValues,
        min: 1,
        max: 10,
        divisions: 9,
        labels: RangeLabels(
          personCountValues.start.round().toString(),
          personCountValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            personCountValues = values;
          });
        },
      ),
    );
  }

  Widget _buildingAge() {
    return ListTile(
      title: const Text("Bina Yaşı"),
      subtitle: RangeSlider(
        values: buildingAgeValues,
        min: 0,
        max: 100,
        divisions: 20,
        labels: RangeLabels(
          buildingAgeValues.start.round().toString(),
          buildingAgeValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            buildingAgeValues = values;
          });
        },
      ),
    );
  }

  Widget _buildingType() {
    return ListTile(
      title: const Text("Bina Tipi"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Chip(
              label: const Text(
                "Daire",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (buildingTypeFlat) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                buildingTypeFlat = !buildingTypeFlat;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Rezidans",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (buildingTypeRezi) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                buildingTypeRezi = !buildingTypeRezi;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Müstakil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (buildingTypeHome) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            onTap: () {
              setState(() {
                buildingTypeHome = !buildingTypeHome;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _meterSquare() {
    return ListTile(
      title: const Text("Metre Kare"),
      subtitle: RangeSlider(
        values: meterSquareValues,
        min: 60,
        max: 300,
        divisions: 24,
        labels: RangeLabels(
          meterSquareValues.start.round().toString(),
          meterSquareValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            meterSquareValues = values;
          });
        },
      ),
    );
  }

  Widget _roomsCount() {
    return ListTile(
      title: const Text("Oda Sayısı"),
      subtitle: Column(
        children: [
          const Text('Oda'),
          RangeSlider(
            values: roomCountValues,
            min: 0,
            max: 6,
            divisions: 7,
            labels: RangeLabels(
              roomCountValues.start.round().toString(),
              roomCountValues.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                roomCountValues = values;
              });
            },
          ),
          const Text('Salon'),
          RangeSlider(
            values: hallCountValues,
            min: 0,
            max: 3,
            divisions: 4,
            labels: RangeLabels(
              hallCountValues.start.round().toString(),
              hallCountValues.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                hallCountValues = values;
              });
            },
          ),
          const Text('Banyo'),
          RangeSlider(
            values: bathroomCountValues,
            min: 0,
            max: 3,
            divisions: 4,
            labels: RangeLabels(
              bathroomCountValues.start.round().toString(),
              bathroomCountValues.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                bathroomCountValues = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
