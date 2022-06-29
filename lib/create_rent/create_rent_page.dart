import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateRentPage extends StatefulWidget {
  const CreateRentPage({Key? key}) : super(key: key);

  @override
  State<CreateRentPage> createState() => _CreateRentPageState();
}

class _CreateRentPageState extends State<CreateRentPage> {
  int rentType = 0; // 1:kalıcı, 2:günlük
  int price = 0;
  int lookingGender = 0; // 1:erkek 2:kadın 3:farketmez
  int personCount = 0;
  int buildingAge = 0;
  // Konut Tipi
  int buildingType = 0; // 1:daire 2:rezidans 3:müstakil
  int meterSquare = 0;
  // Oda Sayıları
  int roomsCount = 0;
  int hallCount = 0;
  int bathCount = 0;
  // Mobilyalı mı
  int isFurnished = 0; // 1:evet, 2:hayır
  // Kalacak kişi için mobilyalı mı
  int isFurnishedToNewPerson = 0; // 1:evet, 2:hayır
  int deposit = 0;
  int dues = 0;
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
  int smoke = 0; // 1 evet, 2 hayır
  int alcohol = 0; // 1 evet, 2 hayır
  // Evcil Hayvan
  bool petCat = true;
  bool petDog = true;
  bool petBird = true;
  bool petOthers = true;
  int vegan = 0; // 1 kesinlikle, 2 farketmez
  int child = 0; // 1 olmamalı, 2 farketmez

  // Resim
  // List<XFile>? _imageFileList;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  ImagePicker imagePicker = new ImagePicker();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            // getLocation(),
            // dailyOrPersistent(),
            // homeCriteria(),
            // personalCriteria(),
            // describeWidget(),
            getPhotos(),
          ],
        ),
      ),
    );
  }

  Widget getLocation() {
    return const Placeholder(
      fallbackHeight: 200,
      fallbackWidth: 200,
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

  Widget dailyOrPersistent() {
    return Center(
      child: ListTile(
        title: const Text("İlan Tipi"),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            myChip(
              caption: "Kalıcı",
              isActive: rentType == 1,
              onSelected: () {
                setState(() {
                  rentType = 1;
                });
              },
            ),
            myChip(
              caption: "Günlük",
              isActive: rentType == 2,
              onSelected: () {
                setState(() {
                  rentType = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget homeCriteria() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                priceWidget(),
                lookingGenderWidget(), // Aranan Cinsiyet
                personCountWidget(), // Evde kalan kişi sayısı
                buildingAgeWidget(), // Bina yaşı
                buildingTypeWidget(), // Konut tipi
                meterSquareWidget(),
                roomsCountWidget(),
                hallCountWidget(),
                bathCountWidget(),
                isFurnishedWidget(),
                isFurnishedToNewPersonWidget(),
                depositWidget(),
                duesWidget(),
                detailsWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget priceWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Fiyat (Aylık)",
        hintText: "2500",
      ),
    );
  }

  Widget lookingGenderWidget() {
    return ListTile(
      title: const Text("Aranan Cinsiyet"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Erkek",
            isActive: lookingGender == 1,
            onSelected: () {
              setState(() {
                lookingGender = 1;
              });
            },
          ),
          myChip(
            caption: "Kadın",
            isActive: lookingGender == 2,
            onSelected: () {
              setState(() {
                lookingGender = 2;
              });
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: lookingGender == 3,
            onSelected: () {
              setState(() {
                lookingGender = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget personCountWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Evde Kalan Kişi Sayısı (Siz Dahil)",
        hintText: "2",
      ),
    );
  }

  Widget buildingAgeWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Bina Yaşı",
        hintText: "10",
      ),
    );
  }

  Widget buildingTypeWidget() {
    return ListTile(
      title: const Text("Bina Tipi"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Daire",
            isActive: buildingType == 1,
            onSelected: () {
              setState(() {
                buildingType = 1;
              });
            },
          ),
          myChip(
            caption: "Rezidans",
            isActive: buildingType == 2,
            onSelected: () {
              setState(() {
                buildingType = 2;
              });
            },
          ),
          myChip(
            caption: "Müstakil",
            isActive: buildingType == 3,
            onSelected: () {
              setState(() {
                buildingType = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget meterSquareWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Metre Kare",
        hintText: "100",
      ),
    );
  }

  Widget roomsCountWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Oda Sayısı",
        hintText: "2",
      ),
    );
  }

  Widget hallCountWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Salon Sayısı",
        hintText: "1",
      ),
    );
  }

  Widget bathCountWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Banyo Sayısı",
        hintText: "1",
      ),
    );
  }

  Widget _isFurnished() {
    return ListTile(
      title: const Text("Mobilyalı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Evet",
            isActive: isFurnished == 1,
            onSelected: () {
              setState(() {
                isFurnished = 1;
              });
            },
          ),
          myChip(
            caption: "Hayır",
            isActive: isFurnished == 2,
            onSelected: () {
              setState(() {
                isFurnished = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget isFurnishedWidget() {
    return ListTile(
      title: const Text("Mobilyalı"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Evet",
            isActive: isFurnished == 1,
            onSelected: () {
              setState(() {
                isFurnished = 1;
              });
            },
          ),
          myChip(
            caption: "Hayır",
            isActive: isFurnished == 2,
            onSelected: () {
              setState(() {
                isFurnished = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget isFurnishedToNewPersonWidget() {
    return ListTile(
      title: const Text("Kalacak Kişiye Mobilyalı mı?"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myChip(
            caption: "Evet",
            isActive: isFurnishedToNewPerson == 1,
            onSelected: () {
              setState(() {
                isFurnishedToNewPerson = 1;
              });
            },
          ),
          myChip(
            caption: "Hayır",
            isActive: isFurnishedToNewPerson == 2,
            onSelected: () {
              setState(() {
                isFurnishedToNewPerson = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget depositWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Deposito",
        hintText: "1000",
      ),
    );
  }

  Widget duesWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Aidat",
        hintText: "100",
      ),
    );
  }

  Widget detailsWidget() {
    return ListTile(
      title: const Text("Ayrıntılar"),
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

  Widget personalCriteria() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ageWidget(),
                genderChips(),
                jobChips(),
                smokeChips(),
                alcoholChips(),
                petChips(),
                veganChips(),
                childChips(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ageWidget() {
    return ListTile(
      title: const Text("Aradığınız Yaş Aralığı"),
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

  Widget genderChips() {
    return ListTile(
      title: const Text("Aradığınız Cinsiyet"),
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

  Widget jobChips() {
    return ListTile(
      title: const Text("Olabilecek Meslekler (İstenilmeyeni çıkarınız)"),
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

  Widget smokeChips() {
    return ListTile(
      title: const Text("Sigara İçilebilir mi?"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Evet",
            isActive: smoke == 1,
            onSelected: () {
              smoke = 1;
            },
          ),
          myChip(
            caption: "Hayır",
            isActive: smoke == 2,
            onSelected: () {
              smoke = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget alcoholChips() {
    return ListTile(
      title: const Text("Alkol alınabilir mi?"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Evet",
            isActive: alcohol == 1,
            onSelected: () {
              alcohol = 1;
            },
          ),
          myChip(
            caption: "Hayır",
            isActive: alcohol == 2,
            onSelected: () {
              alcohol = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget petChips() {
    return ListTile(
      title: const Text("Evcil Hayvan (İstenilmeyeni Çıkarınız)"),
      subtitle: Wrap(
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

  Widget veganChips() {
    return ListTile(
      title: const Text("Vegan mı olmalı?"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Kesinlikle",
            isActive: vegan == 1,
            onSelected: () {
              vegan = 1;
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: vegan == 2,
            onSelected: () {
              vegan = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget childChips() {
    return ListTile(
      title: const Text("Çocuğu olabilir mi"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Olmamalı",
            isActive: child == 1,
            onSelected: () {
              child = 1;
            },
          ),
          myChip(
            caption: "Farketmez",
            isActive: child == 2,
            onSelected: () {
              child = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget describeWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Açıklama",
          hintText: "100",
        ),
        keyboardType: TextInputType.multiline,
        minLines: 6,
        maxLines: null,
      ),
    );
  }

  Widget getPhotos() {
    return Column(
      children: [
        Text("3 Fotoğraf Seçiniz"),
        SizedBox(
          height: 52,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              try {
                // XFile? image = await imagePicker.pickImage(
                //   source: ImageSource.gallery,
                //   imageQuality: 50,
                // );
                PickedFile? image = await imagePicker.getImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                );
                setState(() {
                  if (image != null) {
                    _image = File(image.path);
                  }
                });
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(color: Colors.red[200]),
              child: _image != null
                  ? Image.file(
                      _image!,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.red[200]),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
