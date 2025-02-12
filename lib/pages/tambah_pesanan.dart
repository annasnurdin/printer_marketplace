import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printer_marketplace/themes/colors.dart';
import 'package:printer_marketplace/model/pesanan_model.dart';

import '../model/firestore_service.dart';

class TambahPesanan extends StatefulWidget {
  const TambahPesanan({super.key});

  @override
  State<TambahPesanan> createState() => _TambahPesananState();
}

class _TambahPesananState extends State<TambahPesanan> {
  final TextEditingController _nomorResiController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  String? _selectedKurir;
  String? _selectedProduk;
  final FirestoreService firestoreService = FirestoreService();

  Future<void> _pasteFromClipboard(TextEditingController controller) async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      setState(() {
        controller.text = clipboardData.text!;
      });
    }
  }

  Future<void> _simpanPesanan() async {
    if (_nomorResiController.text.isEmpty ||
        _alamatController.text.isEmpty ||
        _qtyController.text.isEmpty ||
        _selectedKurir == null ||
        _selectedProduk == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi!")),
      );
      return;
    }

    final pesanan = Pesanan(
      _nomorResiController.text,
      _alamatController.text,
      _selectedKurir!,
      _selectedProduk!,
      int.parse(_qtyController.text), // Perbaikan di sini
      false, // expand default false
    );

    await firestoreService.tambahPesanan(pesanan);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nomorResiController.dispose();
    _alamatController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putih,
      floatingActionButton: FloatingActionButton(
        onPressed: _simpanPesanan,
        tooltip: "Simpan",
        backgroundColor: biru,
        foregroundColor: putih,
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        backgroundColor: biru,
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text("Tambah Pesanan", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nomorResiController,
                decoration: InputDecoration(
                  labelText: "Nomor Resi",
                  suffixIcon: IconButton(
                    onPressed: () => _pasteFromClipboard(_nomorResiController),
                    icon: const Icon(Icons.paste),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: biru, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _alamatController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  suffixIcon: IconButton(
                    onPressed: () => _pasteFromClipboard(_alamatController),
                    icon: const Icon(Icons.paste),
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: biru, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedKurir,
                decoration: InputDecoration(
                  labelText: "Kurir",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: biru, width: 2),
                  ),
                ),
                items: ["SPX", "JNE", "JNT", "REGULER"]
                    .map((kurir) =>
                        DropdownMenuItem(value: kurir, child: Text(kurir)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedKurir = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedProduk,
                decoration: InputDecoration(
                  labelText: "Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: biru, width: 2),
                  ),
                ),
                items: ["LEM", "PIGEON", "BENANG", "JARUM"]
                    .map((produk) =>
                        DropdownMenuItem(value: produk, child: Text(produk)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProduk = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: _qtyController,
                decoration: InputDecoration(
                  labelText: "QTY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: biru, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
