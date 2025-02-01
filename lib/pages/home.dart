import 'package:flutter/material.dart';
import 'package:printer_marketplace/model/pesanan_model.dart';
import 'package:printer_marketplace/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pesanan = List.generate(
    20,
    (i) => Pesanan(
      "SPX123${i + 1}",
      "alamat  ${i + 1}",
      "Shopee Xpress",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            tooltip: "Hubungkan Printer",
            backgroundColor: biru,
            foregroundColor: putih,
            child: const Icon(Icons.link),
          ),
          const SizedBox(height: 3),
          FloatingActionButton(
            onPressed: () {},
            tooltip: "Tambah Pesanan",
            backgroundColor: biru,
            foregroundColor: putih,
            child: const Icon(Icons.add),
          )
        ],
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, right: 28.0, left: 15.0),
                child: AppBar(
                  backgroundColor: primaryColor,
                  title: Text(
                    "PrinterMP",
                    style: TextStyle(color: putih),
                  ),
                  actions: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: putih,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications_none_rounded,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: pesanan.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      leading: const Icon(Icons.check_box, color: Colors.blue),
                      title: Text(
                        pesanan[index].nomorResi,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(pesanan[index].kurir),
                      childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      children: [
                        ExpansionTile(
                          expandedAlignment: Alignment.topLeft,
                          title: const Text(
                            'Detail Pesanan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    pesanan[index].alamat,
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                              tooltip: 'Delete',
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              tooltip: 'Edit',
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.print_outlined),
                              tooltip: 'Print',
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 8, 0, 10),
                          child: Text(
                              "Alamatnya disini panjang sekali panjang banget sampai bawah"),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
