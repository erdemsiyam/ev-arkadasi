import 'package:flutter/material.dart';

class MyFavoriesPage extends StatelessWidget {
  const MyFavoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    _rentTile(
                      title: "İlan Başlığı (2+1)",
                      price: 2100,
                      isActive: true,
                    ),
                    _rentTile(
                      title: "İlan Başlığı (2+1)",
                      price: 2100,
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rentTile({
    required String title,
    required int price,
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {},
            leading: const SizedBox(
              height: 80,
              width: 80,
              child: FlutterLogo(),
            ),
            title: Text(title),
            subtitle: Text("$price TL"),
            trailing: IconButton(
              onPressed: () {
                // Silerken emin misiniz
              },
              iconSize: 30,
              icon: const Icon(Icons.star),
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
