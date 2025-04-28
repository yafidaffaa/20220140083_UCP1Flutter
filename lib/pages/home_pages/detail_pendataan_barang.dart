import 'package:flutter/material.dart';
import 'package:ucp1_flutter/pages/home_page.dart';

class DetailPendataanBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;
  final String totalHarga;

  const DetailPendataanBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDFF5DD),
                  border: Border.all(
                    color: Color.fromARGB(57, 49, 160, 27),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF32A01B),
                  size: 70,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Data Berhasil Disimpan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Tanggal', tanggal),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _buildDetailRow('Jenis Transaksi', jenisTransaksi),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _buildDetailRow('Jenis Barang', jenisBarang),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _buildDetailRow('Jumlah Barang', jumlahBarang),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _buildDetailRow('Jenis Harga Satuan', hargaSatuan),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                    _buildDetailRow('Total Harga', 'Rp. $totalHarga'),
                    Divider(
                      color: const Color.fromARGB(127, 158, 158, 158),
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 50, 140, 27),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        (route) =>
                            route is MaterialPageRoute &&
                            route.builder(context) is HomePage,
                      );
                    },

                    child: const Text(
                      'Selesai',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black87)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
