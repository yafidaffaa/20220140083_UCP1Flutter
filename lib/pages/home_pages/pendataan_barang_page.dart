import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1_flutter/pages/login_page.dart';

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({super.key});

  @override
  State<PendataanBarangPage> createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController tanggalTransaksiController =
      TextEditingController();
  final TextEditingController jenisTransaksiController =
      TextEditingController();
  final TextEditingController jenisBarangController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();

  int totalHarga = 0;

  List<String> jenisTransaksiList = ['Barang Masuk', 'Barang Keluar'];
  String? selectedJenisTransaksi;

  List<String> jenisBarangList = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];
  String? selectedJenisBarang;

  DateTime? _selectedDate;
  bool _timeError = false;

  Map<String, int> hargaBarang = {
    'Carrier': 540000,
    'Sleeping Bag': 250000,
    'Tenda': 700000,
    'Sepatu': 350000,
  };

  @override
  void initState() {
    super.initState();
    hargaSatuanController.text = 'Rp. 0';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _timeError = false;
      });
    }
  }

  void _updateHargaSatuan(String? selectedBarang) {
    if (selectedBarang != null && hargaBarang.containsKey(selectedBarang)) {
      setState(() {
        hargaSatuanController.text = 'Rp. ${hargaBarang[selectedBarang]}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Pilih Tanggal',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color:
                              _timeError
                                  ? Colors.red
                                  : const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _selectedDate == null
                                    ? 'Tanggal Transaksi'
                                    : DateFormat(
                                      'EEEE, dd-MM-yyyy',
                                    ).format(_selectedDate!),
                                style: TextStyle(
                                  color:
                                      _selectedDate == null
                                          ? Colors.grey.shade600
                                          : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_timeError)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tanggal tidak boleh kosong',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: DropdownButtonFormField<String>(
                      value: selectedJenisTransaksi,
                      decoration: const InputDecoration(
                        labelText: 'Jenis Transaksi',
                        hintText: 'Jenis Transaksi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      items:
                          jenisTransaksiList.map((String jenisTransaksi) {
                            return DropdownMenuItem<String>(
                              value: jenisTransaksi,
                              child: Text(jenisTransaksi),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedJenisTransaksi = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pilih jenis transaksi';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: DropdownButtonFormField<String>(
                      value: selectedJenisBarang,
                      decoration: const InputDecoration(
                        labelText: 'Jenis Barang',
                        hintText: 'Jenis Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      items:
                          jenisBarangList.map((String jensiBarang) {
                            return DropdownMenuItem<String>(
                              value: jensiBarang,
                              child: Text(jensiBarang),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedJenisBarang = value!;
                          _updateHargaSatuan(value);
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pilih jenis barang';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Jumlah Barang',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: jumlahBarangController,
                              decoration: const InputDecoration(
                                hintText: 'Jumlah Barang',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Jumlah barang tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Harga Satuan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: hargaSatuanController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: 'Harga Satuan',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Jumlah barang tidak boleh kosong';
                                }
                                return null;
                              },
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
                          if (_selectedDate == null) {
                            setState(() {
                              _timeError = true;
                            });
                          }
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Submit',
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
