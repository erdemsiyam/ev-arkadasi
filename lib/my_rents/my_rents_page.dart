import 'package:flutter/material.dart';

class MyRentsPage extends StatelessWidget {
  const MyRentsPage({Key? key}) : super(key: key);

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
        color: (isActive) ? Colors.white : Colors.red[100],
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
            trailing: (isActive)
                ? Wrap(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        color: Colors.orange,
                      )
                    ],
                  )
                : MaterialButton(
                    onPressed: () {},
                    child: const Text("Aktif Et"),
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
