import 'package:flutter/material.dart';
import 'package:gudang_intel/api/repository.dart';
import 'package:gudang_intel/input.dart';

class Tambah extends StatelessWidget {
  Tambah({super.key});

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _coreController = TextEditingController();
  final TextEditingController _frekuensiController = TextEditingController();
  final TextEditingController _tdpController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();

    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      body: ListView(
        physics: const PageScrollPhysics(),
        children: [
          //--- Judul ---//
          const Padding(
            padding: EdgeInsets.only(top: 70.0, left: 32.0, bottom: 50),
            child: Text(
              "Tambah Prosesor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Arial-Rounded",
              ),
            ),
          ),

          //--- Text Input ---//
          InputCpu(
            hint: "Nama Prosesor",
            inputType: TextInputType.text,
            controller: _namaController,
          ),

          InputCpu(
            hint: "Jumlah Core",
            inputType: TextInputType.number,
            controller: _coreController,
          ),

          InputCpu(
            hint: "Frekuensi Dasar",
            inputType: TextInputType.number,
            controller: _frekuensiController,
          ),

          InputCpu(
            hint: "TDP",
            inputType: TextInputType.number,
            controller: _tdpController,
          ),

          InputCpu(
            hint: "URL Gambar",
            inputType: TextInputType.text,
            controller: _imgController,
          ),

          //--- Tombol Tambah ---//
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 42),
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await repository.postData(
                      _namaController.text,
                      int.parse(_coreController.text),
                      double.parse(_frekuensiController.text),
                      int.parse(_tdpController.text),
                      _imgController.text,
                    );

                    if (response) {
                      if (context.mounted) Navigator.pop(context);
                    }
                  },
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
