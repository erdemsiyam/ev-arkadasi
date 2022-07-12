import 'package:flutter/material.dart';

class RentDetailPage extends StatelessWidget {
  const RentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _photosSection(),
              _titleSection(),
              _roomCountSection(),
              const SizedBox(height: 50),
              _requiredPersonalitySection(),
              const SizedBox(height: 50),
              _homeDetail(),
              const SizedBox(height: 50),
              _sendMessageSection(),
              const SizedBox(height: 50),
              _reportSection(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _photosSection() {
    return Row(
      children: const [
        FlutterLogo(size: 160),
        FlutterLogo(size: 160),
        FlutterLogo(size: 160),
      ],
    );
  }

  Widget _titleSection() {
    return const Text("Başlık başlık");
  }

  Widget _roomCountSection() {
    return const Text('2+1');
  }

  Widget _requiredPersonalitySection() {
    return const Text('''
Talep Edilen Kişilik Bilgileri :
+ Cinsiyet
+ Yaş
Meslek: öğrenci, işçi, serbest, memur, öğretmen, özel sektör, polis/asker
Sigara : Var, yok, nadir
Alkol: Var, yok, nadir
Evcil Hayvan: kedi, köpek, kuş, yok
Vegan: hayır, evet
çocuk: evet, hayır
banyo ortak: evet, hayır
kendi odam: evet, hayır
''');
  }

  Widget _homeDetail() {
    return const Text('''
+fiyat
+ilan veren yaş
+ilan veren cinsiyet
+aradığı cinsiyet
+kalan kişi sayısı
+bina yaşı
+konut türü : daire rezi müstak
+m2
+oda sayısı 3+1
+mobilyalı
+Kalacak kişi için mobilyalı mı
+deposito
+aidat
ayrıntı özellikler
	bulunduğu kat
	internet
	buzdolabı
	çamaşır mak
	bulaşık mak
	tv
	kalorifer
	soba
	durak
	metro
	kapalı otoparkaçık otopark
	güvenlik
	site
	spor salonu
	asansör
	yüzme havuzu
''');
  }

  Widget _sendMessageSection() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Mesaj Gönder'),
    );
  }

  Widget _reportSection() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: const [
          Icon(
            Icons.report_problem_sharp,
            color: Colors.red,
          ),
          Text('Şikayet et'),
        ],
      ),
    );
  }
}
