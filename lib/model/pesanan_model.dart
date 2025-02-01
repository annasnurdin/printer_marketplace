import 'package:flutter/material.dart';

class Pesanan {
  final String nomorResi;
  final String alamat;
  final String kurir;
  final String produk;
  bool expand = false;
  bool sudahPrint = false;
  ExpansionTileController controller = ExpansionTileController();
  Pesanan(
    this.nomorResi,
    this.alamat,
    this.kurir,
    this.produk,
    this.expand,
  );
}
