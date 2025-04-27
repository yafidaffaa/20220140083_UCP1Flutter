import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 50, 140, 27),
        centerTitle: true,
        elevation: 0,
      ),
      
  }
}
