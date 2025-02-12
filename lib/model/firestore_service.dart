import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:printer_marketplace/model/pesanan_model.dart';

class FirestoreService {
  final CollectionReference listPesanan =
      FirebaseFirestore.instance.collection('list-pesanan');

  Future<void> tambahPesanan(Pesanan pesanan) {
    return listPesanan.add({
      'nomorResi': pesanan.nomorResi,
      'alamat': pesanan.alamat,
      'kurir': pesanan.kurir,
      'produk': pesanan.produk,
      'qty': pesanan.qty,
      'expand': pesanan.expand,
      'sudahPrint': pesanan.sudahPrint,
    });
  }

  Stream<List<Pesanan>> getPesanan() {
    return listPesanan.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Pesanan(
          doc['nomorResi'],
          doc['alamat'],
          doc['kurir'],
          doc['produk'],
          doc['expand'] ?? false,
          doc['qty'] ?? 0,
        )..sudahPrint = doc['sudahPrint'] ?? false;
      }).toList();
    });
  }

  Future<void> updatePesanan(String id, Map<String, dynamic> data) {
    return listPesanan.doc(id).update(data);
  }

  Future<void> hapusPesanan(String id) {
    return listPesanan.doc(id).delete();
  }
}
