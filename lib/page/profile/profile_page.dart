import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _photosArea(),
            _nameArea(),
            _socialLinksArea(),
            _phoneArea(),
            _describeArea(),
            _reportArea(),
          ],
        ),
      ),
    );
  }

  Widget _photosArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // Foto + Sil Butonları
        _photoFrame(),
        _photoFrame(),
        _photoFrame(),

        // Foto Ekle
        IconButton(
          onPressed: () {},
          color: Colors.green,
          icon: const Icon(Icons.add_circle),
        ),
      ],
    );
  }

  Widget _photoFrame() {
    return Column(
      children: [
        const FlutterLogo(size: 120),
        IconButton(
          onPressed: () {},
          color: Colors.red,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  Widget _nameArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Ahmet Yılmaz"),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget _socialLinksArea() {
    return Column(
      children: const [
        Text("Facebook: XXX"),
        Text("Instagram: XXX"),
      ],
    );
  }

  Widget _phoneArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Tel: +90 551 132 75 35"),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Text("Değiştir"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _describeArea() {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          Text(
            "Açıklama This text is very very very very very very very very very very very very very very very very very very very very very very very very very long",
            overflow: TextOverflow.clip,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  Widget _reportArea() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.report),
      color: Colors.red,
    );
  }
}
