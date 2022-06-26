import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Fiyat
  RangeValues priceValues = RangeValues(1000, 10000);
  // Kalan Kişi sayııs
  RangeValues personCountValues = RangeValues(1, 3);
  // Bina yaşı
  RangeValues buildingAgeValues = RangeValues(0, 100);
  // Konut Tipi
  bool buildingTypeFlat = true;
  bool buildingTypeRezi = true;
  bool buildingTypeHome = true;
  // M2
  RangeValues meterSquareValues = RangeValues(60, 300);
  // Oda Sayısı
  RangeValues roomCountValues = RangeValues(0, 6);
  RangeValues hallCountValues = RangeValues(0, 3);
  RangeValues bathroomCountValues = RangeValues(0, 3);
  // Bulunduğu Kat
  bool floorEntery = true; // giriş kat
  bool floorGarden = true; // bahçe kay
  bool floorRoof = true; // çatı kat
  bool floorDublex = true; // dublex
  bool floor1to3 = true; // 1-3
  bool floor4to10 = true; // 4-10
  bool floor11toUp = true; // 10 ve fazlası
  // depozito
  RangeValues depositValues = RangeValues(0, 10000);
  // aidat
  RangeValues duesValues = RangeValues(0, 2000);
  // mobilyalı
  int isFurnished = 0; // 1: Yes, 2: No
  // Kalacak kişi için mobilyalı mı
  int isFurnishedToNewPerson = 0; // 1: Yes, 2: No
  // Banyolar Ayrı mı
  int isBathSeperated = 0; // 1: olmalı, 2: farketmez
  // Odam Ayrı mı
  int isRoomsSeperated = 0; // 1: olmalı, 2: farketmez
  // Ayrıntılar
  List<String> details = [
    'internet',
    'tv',
    'buzdolabı',
    'çamaşır mak',
    'bulaşık mak',
    'kalorifer',
    'soba',
    'durak',
    'metro',
    'kapalı otopark',
    'açık otopark',
    'güvenlik',
    'site',
    'spor salonu',
    'asansör',
    'yüzme havuzu'
  ];
  List<String> selectedDetails = [];
  // Sahip Yaşı
  RangeValues ownerAgeValues = RangeValues(18, 80);
  // Cinsiyet
  int gender = 3; // 1: erkek, 2: kadın, 3: farketmez
  // Meslek
  bool jobStudent = true;
  bool jobSelfEmployment = true;
  bool jobOfficer = true;
  bool jobTeacher = true;
  bool jobPrivateSectore = true;
  bool jobPoliceSoldier = true;
  // Sigara
  int isSmoke = 2; // 1: Yes, 2: No, 3: Everyone
  // Alkol
  int isAlcohol = 2; // 1: Yes, 2: No, 3: Everyone
  // Evcil Hayvan
  bool petCat = true;
  bool petDog = true;
  bool petBird = true;
  bool petOthers = true;
  // Vegan
  int isVegan = 2; // Olmalı, Farketmez
  // Çocuk
  int hasChild = 2; // Olmamalı, Farketmez

/*
TODO: Böyle düzelt
// Ev Kriterleri
+fiyat
+kalan kişi sayısı
+bina yaşı
+konut türü : daire rezi müstak
+m2
+oda sayısı 3+1
+bulunduğu kat
+deposito
+aidat
+mobilyalı
+Kalacak kişi için mobilyalı mı
+banyo farklı: Olmalı, farketmez
+kendi odam: olmalı, farketmez

+ayrıntı özellikler
  'internet',
  'tv',
  'buzdolabı',
  'çamaşır mak',
  'bulaşık mak',
  'kalorifer',
  'soba',
  'durak',
  'metro',
  'kapalı otopark',
  'açık otopark',
  'güvenlik',
  'site',
  'spor salonu',
  'asansör',
  'yüzme havuzu'

Kişilikler
Yaş
cins
Meslek: öğrenci, işçi, serbest, memur, öğretmen, özel sektör, polis/asker
Sigara : Olmamalı, Farketmez
Alkol: Olmamalı, Farketmez
Evcil Hayvan: kedi, köpek, kuş, Diğer, (multi seç)
Vegan: Olmalı, Farketmez
çocuk: Olmamalı, Farketmez


 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _backButton(),

              // Ev Kriterleri
              const Divider(),
              const Text('Ev Kriterleri'),
              _price(),
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
              _flootOfFlat(),
              const Divider(),
              _deposit(),
              const Divider(),
              _dues(),
              const Divider(),
              _isFurnished(),
              const Divider(),
              _isFurnishedToNewPerson(),
              const Divider(),
              _bathSeperated(),
              const Divider(),
              _roomsSeperated(),
              const Divider(),
              _details(),

              // Kişilik Kriteri
              const Divider(),
              const Text('Kişilik Kriterleri'),
              _ownerAge(),
              const Divider(),
              _gender(),
              const Divider(),
              _job(),
              const Divider(),
              _smoke(),
              const Divider(),
              _alcohol(),
              const Divider(),
              _pet(),
              const Divider(),
              _vegan(),
              const Divider(),
              _child(),
              const SizedBox(height: 150),
            ],
          ),
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

  Widget myChip({
    required String caption,
    required bool isActive,
    required VoidCallback onSelected,
    EdgeInsets? padding,
  }) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: InkWell(
        child: Chip(
          label: Text(
            caption,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: (isActive) ? Colors.green : Colors.blueAccent,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        onTap: () {
          setState(() {
            onSelected.call();
          });
        },
      ),
    );
  }

  Widget _backButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget _price() {
    return ListTile(
      title: const Text("Fiyat"),
      subtitle: RangeSlider(
        values: priceValues,
        min: 1000,
        max: 10000,
        divisions: 18,
        labels: RangeLabels(
          priceValues.start.round().toString(),
          priceValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            priceValues = values;
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
        min: 18,
        max: 80,
        divisions: 31,
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

  Widget _gender() {
    return ListTile(
      title: const Text("Cinsiyet"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Erkek",
            isActive: gender == 1,
            onSelected: () {
              setState(() {
                gender = 1;
              });
            },
          ),
          myChip(
            caption: "Kadın",
            isActive: gender == 2,
            onSelected: () {
              setState(() {
                gender = 2;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: gender == 3,
            onSelected: () {
              setState(() {
                gender = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _bathSeperated() {
    return ListTile(
      title: const Text("Banyolar Ayrı mı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olmalı",
            isActive: isBathSeperated == 1,
            onSelected: () {
              setState(() {
                isBathSeperated = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isBathSeperated == 2,
            onSelected: () {
              setState(() {
                isBathSeperated = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _roomsSeperated() {
    return ListTile(
      title: const Text("Odam Ayrı mı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olmalı",
            isActive: isRoomsSeperated == 1,
            onSelected: () {
              setState(() {
                isRoomsSeperated = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isRoomsSeperated == 2,
            onSelected: () {
              setState(() {
                isRoomsSeperated = 2;
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
          myChip(
            caption: "Daire",
            isActive: buildingTypeFlat,
            onSelected: () {
              setState(() {
                buildingTypeFlat = !buildingTypeFlat;
              });
            },
          ),
          myChip(
            caption: "Rezidans",
            isActive: buildingTypeRezi,
            onSelected: () {
              setState(() {
                buildingTypeRezi = !buildingTypeRezi;
              });
            },
          ),
          myChip(
            caption: "Müstakil",
            isActive: buildingTypeHome,
            onSelected: () {
              setState(() {
                buildingTypeHome = !buildingTypeHome;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _details() {
    return ListTile(
      title: const Text("Ayrıntılar (Şart Olanları Seçiniz)"),
      subtitle: Wrap(
        children: [
          for (String detail in details)
            myChip(
              caption: detail,
              isActive: selectedDetails.contains(detail),
              onSelected: () {
                setState(() {
                  if (selectedDetails.contains(detail)) {
                    selectedDetails.remove(detail);
                  } else {
                    selectedDetails.add(detail);
                  }
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _flootOfFlat() {
    return ListTile(
      title: const Text("Bulunduğu Kat"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Giriş Kat",
            isActive: floorEntery,
            onSelected: () {
              setState(() {
                floorEntery = !floorEntery;
              });
            },
          ),
          myChip(
            caption: "Bahçe Kat",
            isActive: floorGarden,
            onSelected: () {
              setState(() {
                floorGarden = !floorGarden;
              });
            },
          ),
          myChip(
            caption: "Çatı Kat",
            isActive: floorRoof,
            onSelected: () {
              setState(() {
                floorRoof = !floorRoof;
              });
            },
          ),
          myChip(
            caption: "Dublex",
            isActive: floorDublex,
            onSelected: () {
              setState(() {
                floorDublex = !floorDublex;
              });
            },
          ),
          myChip(
            caption: "1 - 3",
            isActive: floor1to3,
            onSelected: () {
              setState(() {
                floor1to3 = !floor1to3;
              });
            },
          ),
          myChip(
            caption: "4 - 10",
            isActive: floor4to10,
            onSelected: () {
              setState(() {
                floor4to10 = !floor4to10;
              });
            },
          ),
          myChip(
            caption: "11 ve fazlası",
            isActive: floor11toUp,
            onSelected: () {
              setState(() {
                floor11toUp = !floor11toUp;
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

  Widget _isFurnished() {
    return ListTile(
      title: const Text("Mobilyalı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Chip(
              label: const Text(
                "Evet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (isFurnished == 1) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                if (isFurnished == 1) {
                  isFurnished = 0;
                  return;
                }
                isFurnished = 1;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Hayır",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  (isFurnished == 2) ? Colors.green : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                if (isFurnished == 2) {
                  isFurnished = 0;
                  return;
                }
                isFurnished = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _isFurnishedToNewPerson() {
    return ListTile(
      title: const Text("Kalacak Kişiye Mobilyalı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Chip(
              label: const Text(
                "Evet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: (isFurnishedToNewPerson == 1)
                  ? Colors.green
                  : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                if (isFurnishedToNewPerson == 1) {
                  isFurnishedToNewPerson = 0;
                  return;
                }
                isFurnishedToNewPerson = 1;
              });
            },
          ),
          InkWell(
            child: Chip(
              label: const Text(
                "Hayır",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: (isFurnishedToNewPerson == 2)
                  ? Colors.green
                  : Colors.blueAccent,
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            onTap: () {
              setState(() {
                if (isFurnishedToNewPerson == 2) {
                  isFurnishedToNewPerson = 0;
                  return;
                }
                isFurnishedToNewPerson = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _smoke() {
    return ListTile(
      title: const Text("Sigara İçilmesi"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olamaz",
            isActive: isSmoke == 1,
            onSelected: () {
              setState(() {
                isSmoke = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isSmoke == 2,
            onSelected: () {
              setState(() {
                isSmoke = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _alcohol() {
    return ListTile(
      title: const Text("Alkol İçilmesi"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olamaz",
            isActive: isAlcohol == 1,
            onSelected: () {
              setState(() {
                isAlcohol = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isAlcohol == 2,
            onSelected: () {
              setState(() {
                isAlcohol = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _pet() {
    return ListTile(
      title: const Text("Evcil Hayvan (İstenilmeyeni Çıkarınız)"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Kedi",
            isActive: petCat,
            onSelected: () {
              setState(() {
                petCat = !petCat;
              });
            },
          ),
          myChip(
            caption: "Köpek",
            isActive: petDog,
            onSelected: () {
              setState(() {
                petDog = !petDog;
              });
            },
          ),
          myChip(
            caption: "Kuş",
            isActive: petBird,
            onSelected: () {
              setState(() {
                petBird = !petBird;
              });
            },
          ),
          myChip(
            caption: "Diğerleri",
            isActive: petOthers,
            onSelected: () {
              setState(() {
                petOthers = !petOthers;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _deposit() {
    return ListTile(
      title: const Text("Depozito"),
      subtitle: RangeSlider(
        values: depositValues,
        min: 0,
        max: 10000,
        divisions: 20,
        labels: RangeLabels(
          depositValues.start.round().toString(),
          depositValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            depositValues = values;
          });
        },
      ),
    );
  }

  Widget _dues() {
    return ListTile(
      title: const Text("Aidat"),
      subtitle: RangeSlider(
        values: duesValues,
        min: 0,
        max: 2000,
        divisions: 20,
        labels: RangeLabels(
          duesValues.start.round().toString(),
          duesValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            duesValues = values;
          });
        },
      ),
    );
  }

  Widget _job() {
    return ListTile(
      title: const Text("Sahip İş"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Öğrenci",
            isActive: jobStudent,
            onSelected: () {
              setState(() {
                jobStudent = !jobStudent;
              });
            },
          ),
          myChip(
            caption: "Serbest Meslek",
            isActive: jobSelfEmployment,
            onSelected: () {
              setState(() {
                jobSelfEmployment = !jobSelfEmployment;
              });
            },
          ),
          myChip(
            caption: "Memur",
            isActive: jobOfficer,
            onSelected: () {
              setState(() {
                jobOfficer = !jobOfficer;
              });
            },
          ),
          myChip(
            caption: "Öğretmen",
            isActive: jobTeacher,
            onSelected: () {
              setState(() {
                jobTeacher = !jobTeacher;
              });
            },
          ),
          myChip(
            caption: "Özel Sektör",
            isActive: jobPrivateSectore,
            onSelected: () {
              setState(() {
                jobPrivateSectore = !jobPrivateSectore;
              });
            },
          ),
          myChip(
            caption: "Polis / Asker",
            isActive: jobPoliceSoldier,
            onSelected: () {
              setState(() {
                jobPoliceSoldier = !jobPoliceSoldier;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _vegan() {
    return ListTile(
      title: const Text("Vegan"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olmalı",
            isActive: isVegan == 1,
            onSelected: () {
              setState(() {
                isVegan = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isVegan == 2,
            onSelected: () {
              setState(() {
                isVegan = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _child() {
    return ListTile(
      title: const Text("Çocuklu"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Olmamalı",
            isActive: isVegan == 1,
            onSelected: () {
              setState(() {
                isVegan = 1;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: isVegan == 2,
            onSelected: () {
              setState(() {
                isVegan = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
