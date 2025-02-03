import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BluetoothPairing extends StatefulWidget {
  const BluetoothPairing({super.key});

  @override
  State<BluetoothPairing> createState() => _BluetoothPairingState();
}

class _BluetoothPairingState extends State<BluetoothPairing> {
  String? _selectedBluetooth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putih,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: "Okay",
        backgroundColor: biru,
        foregroundColor: putih,
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        backgroundColor: biru,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Hubungkan Printer",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedBluetooth,
              decoration: InputDecoration(
                labelText: "Select Printer..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: biru, width: 2),
                ),
              ),
              items: ["Bluetooth", "Bluetooth2", "Bluetooth3", "Bluetooth4"]
                  .map((device) => DropdownMenuItem(
                        value: device,
                        child: Text(device),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBluetooth = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hijau,
                    foregroundColor: putih,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded agak kotak
                    ),
                  ),
                  child: const Text("Connect"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: putih,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded agak kotak
                    ),
                  ),
                  child: const Text("Disconnect"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
