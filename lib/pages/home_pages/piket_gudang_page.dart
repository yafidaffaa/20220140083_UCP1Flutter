import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1_flutter/pages/home_pages/detail_piket_gudang_page.dart';

class PiketGudangPage extends StatefulWidget {
  final String email;

  const PiketGudangPage({super.key, required this.email});

  @override
  State<PiketGudangPage> createState() => _PiketGudangPageState();
}

class _PiketGudangPageState extends State<PiketGudangPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  bool _timeError = false;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();

  List<Map<String, dynamic>> listTugas = [];

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.email;
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

  void _addTask() {
    if (_tugasController.text.trim().isNotEmpty) {
      setState(() {
        listTugas.add({
          'task': _tugasController.text.trim(),
          'date':
              _selectedDate != null
                  ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                  : '',
          'name': _namaController.text,
        });
        _tugasController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 50, 140, 27),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama Anggota',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 7),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama anggota tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Pilih Tanggal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                                ? 'Pilih Tanggal'
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
                  child: Text(
                    'Please select a date',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 16),
              const Text(
                'Tugas Piket',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas piket tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timeError = _selectedDate == null;
                      });
                      if (_formKey.currentState!.validate() && !_timeError) {
                        _addTask();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 50, 140, 27),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Tambah'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: const Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child:
                    listTugas.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Belum ada Data',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: listTugas.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => DetailPiketGudangPage(
                                            listTugas: listTugas[index],
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 50, 140, 27),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      listTugas[index]['task'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
