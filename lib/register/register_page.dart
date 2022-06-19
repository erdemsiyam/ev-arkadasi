import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
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
        ),
      ),
    );
  }
}
