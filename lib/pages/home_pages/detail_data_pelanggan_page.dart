import 'package:flutter/material.dart';
import 'package:ucp1_flutter/pages/home_page.dart';

class DetailDataPelangganPage extends StatefulWidget {
  final String namaCust;
  final String email;
  final String noHP;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailDataPelangganPage({
    super.key,
    required this.namaCust,
    required this.email,
    required this.noHP,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  State<DetailDataPelangganPage> createState() =>
      _DetailDataPelangganPageState();
}

class _DetailDataPelangganPageState extends State<DetailDataPelangganPage> {
  final TextEditingController namaCusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaCusController.text = widget.namaCust;
    emailController.text = widget.email;
    noHPController.text = widget.noHP;
    alamatController.text = widget.alamat;
    provinsiController.text = widget.provinsi;
    kodePosController.text = widget.kodePos;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail ${widget.namaCust}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 50, 140, 27),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo-UMY.png', width: 100, height: 100),
                  Padding(padding: const EdgeInsets.only(top: 5, bottom: 10)),
                  Text(
                    widget.namaCust,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.email, style: TextStyle(fontSize: 20)),
                  Text(widget.noHP, style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Alamat',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: alamatController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Provinsi',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Kode Pos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: noHPController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            50,
                            140,
                            27,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.popUntil(
                              context,
                              (route) =>
                                  route is MaterialPageRoute &&
                                  route.builder(context) is HomePage,
                            );
                          }
                        },
                        child: Text(
                          'Selesai',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
