import 'package:ev_arkadasi/service/rent/rent_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _stepperIndex = 0;
  int age = 0;
  int gender = 0; // 1:erkek, 2:kadın
  int job =
      0; //  1 öğrenci, işçi, 2 serbest, 3 memur, 4 öğretmen, 5 özel sektör, 6 polis/asker
  // int smoke = 0; // 1 evet, 2 hayır
  // int alcohol = 0; // 1 evet, 2 hayır
  // int pet = 0; // 1 köpek, kedi, kuş, yok
  // int vegan = 0; // 1 evet, 2 hayır
  // int child = 0; // 1 evet, 2 hayır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stepper(
          currentStep: _stepperIndex,
          steps: [
            Step(
              title: const Text("Personality"),
              content: personalityPart(),
            ),
            Step(
              title: const Text("Profile Photo"),
              content: profilePhotoPart(),
            ),
            Step(
              title: const Text("Name & Phone"),
              content: nameAndPhonePart(),
            ),
          ],
          onStepContinue: () {
            if (_stepperIndex == 3) return;
            setState(() {
              _stepperIndex++;
            });
          },
          onStepTapped: (value) {
            setState(() {
              _stepperIndex = value;
            });
          },
        ),
      ),
    );
  }

  Widget personalityPart() {
    return Column(
      children: [
        ageWidget(),
        genderChips(),
        jobChips(),
        // smokeChips(),
        // alcoholChips(),
        // petChips(),
        // veganChips(),
        // childChips(),
      ],
    );
  }

  Widget myChip({
    required String caption,
    required bool isActive,
    required VoidCallback onSelected,
  }) {
    return InkWell(
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
    );
  }

  Widget ageWidget() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "yaşınız",
        hintText: "30",
      ),
    );
  }

  Widget genderChips() {
    return ListTile(
      title: const Text("Cinsiyetiniz"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Erkek",
            isActive: gender == 1,
            onSelected: () {
              gender = 1;
            },
          ),
          myChip(
            caption: "Kadın",
            isActive: gender == 2,
            onSelected: () {
              gender = 2;
            },
          ),
        ],
      ),
    );
  }

  Widget jobChips() {
    return ListTile(
      title: const Text("Mesleğin"),
      subtitle: Wrap(
        children: [
          myChip(
            caption: "Öğrenci",
            isActive: job == 1,
            onSelected: () {
              job = 1;
            },
          ),
          myChip(
            caption: "İşçi",
            isActive: job == 2,
            onSelected: () {
              job = 2;
            },
          ),
          myChip(
            caption: "Serbest",
            isActive: job == 3,
            onSelected: () {
              job = 3;
            },
          ),
          myChip(
            caption: "Memur",
            isActive: job == 4,
            onSelected: () {
              job = 4;
            },
          ),
          myChip(
            caption: "Öğretmen",
            isActive: job == 5,
            onSelected: () {
              job = 5;
            },
          ),
          myChip(
            caption: "Özel Sektör",
            isActive: job == 6,
            onSelected: () {
              job = 6;
            },
          ),
          myChip(
            caption: "Polis / Asker",
            isActive: job == 7,
            onSelected: () {
              job = 7;
            },
          ),
        ],
      ),
    );
  }

  // Widget smokeChips() {
  //   return ListTile(
  //     title: const Text("Sigara İçiyor musun?"),
  //     subtitle: Wrap(
  //       children: [
  //         myChip(
  //           caption: "Evet",
  //           isActive: smoke == 1,
  //           onSelected: () {
  //             smoke = 1;
  //           },
  //         ),
  //         myChip(
  //           caption: "Hayır",
  //           isActive: smoke == 2,
  //           onSelected: () {
  //             smoke = 2;
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget alcoholChips() {
  //   return ListTile(
  //     title: const Text("Alkol İçiyor musun?"),
  //     subtitle: Wrap(
  //       children: [
  //         myChip(
  //           caption: "Evet",
  //           isActive: alcohol == 1,
  //           onSelected: () {
  //             alcohol = 1;
  //           },
  //         ),
  //         myChip(
  //           caption: "Hayır",
  //           isActive: alcohol == 2,
  //           onSelected: () {
  //             alcohol = 2;
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget petChips() {
  //   return ListTile(
  //     title: const Text("Evcil Hayvanın var mı?"),
  //     subtitle: Wrap(
  //       children: [
  //         myChip(
  //           caption: "Köpek",
  //           isActive: pet == 1,
  //           onSelected: () {
  //             pet = 1;
  //           },
  //         ),
  //         myChip(
  //           caption: "Kedi",
  //           isActive: pet == 2,
  //           onSelected: () {
  //             pet = 2;
  //           },
  //         ),
  //         myChip(
  //           caption: "Kuş",
  //           isActive: pet == 3,
  //           onSelected: () {
  //             pet = 3;
  //           },
  //         ),
  //         myChip(
  //           caption: "Yok",
  //           isActive: pet == 4,
  //           onSelected: () {
  //             pet = 4;
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget veganChips() {
  //   return ListTile(
  //     title: const Text("Vegan mısın?"),
  //     subtitle: Wrap(
  //       children: [
  //         myChip(
  //           caption: "Evet",
  //           isActive: vegan == 1,
  //           onSelected: () {
  //             vegan = 1;
  //           },
  //         ),
  //         myChip(
  //           caption: "Hayır",
  //           isActive: vegan == 2,
  //           onSelected: () {
  //             vegan = 2;
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget childChips() {
  //   return ListTile(
  //     title: const Text("Çocuğun var mı?"),
  //     subtitle: Wrap(
  //       children: [
  //         myChip(
  //           caption: "Evet",
  //           isActive: child == 1,
  //           onSelected: () {
  //             child = 1;
  //           },
  //         ),
  //         myChip(
  //           caption: "Hayır",
  //           isActive: child == 2,
  //           onSelected: () {
  //             child = 2;
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget profilePhotoPart() {
    return Column(
      children: [
        Placeholder(),
        MaterialButton(
          onPressed: () {},
          child: Text("Resim Yükle"),
        ),
      ],
    );
  }

  Widget nameAndPhonePart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: "Ad",
            hintText: "Ahmet",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: "Soyad",
            hintText: "Çalışkan",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: "Telefon",
            hintText: "+90 (551) 132 75 35",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Send Code'),
        ),
        const SizedBox(),
        const TextField(
          decoration: InputDecoration(
            labelText: "Sms Kod",
            hintText: "123456",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Kayıt Ol'),
        ),
      ],
    );
  }
}
