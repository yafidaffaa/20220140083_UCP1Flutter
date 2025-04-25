import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucp1_flutter/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/logo_umy.png', width: 100, height: 100),
          ),
          title: const Text('Home Page'),
          backgroundColor: CupertinoColors.activeGreen,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/promosi_umy.jpg', width: 400, height: 200),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Image.asset('assets/logo_umy.png', width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
