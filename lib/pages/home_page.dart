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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
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
