import 'package:flutter/material.dart';

class DetailPendataanBarangPage extends StatelessWidget {
  final String Tanggal;
  final String JenisTransaksi;
  final String JenisBarang;
  final String JumlahBarang;
  final String HargaSatuan;
  final String TotalHarga;

  const DetailPendataanBarangPage({
    super.key,
    required this.Tanggal,
    required this.JenisTransaksi,
    required this.JenisBarang,
    required this.JumlahBarang,
    required this.HargaSatuan,
    required this.TotalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      Tanggal,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 50, 140, 27),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(255, 50, 140, 27),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        JenisTransaksi,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tanggal Transaksi : $Tanggal'),
                  Text('Jenis Transaksi : $JenisTransaksi'),
                  Text('Jenis Barang : $JenisBarang'),
                  Text('Jumlah Barang : $JumlahBarang'),
                  Text('Harga Satuan : $HargaSatuan'),
                  Text('Total Harga : $TotalHarga'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
