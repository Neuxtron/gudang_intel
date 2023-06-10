import 'package:flutter/material.dart';
import 'package:gudang_intel/api/repository.dart';
import 'package:gudang_intel/input.dart';

class UpdateCpu extends StatelessWidget {
  final String id;
  final String nama;
  final int jlhCore;
  final double frekuensiDasar;
  final int tdp;
  final String img;

  UpdateCpu({
    super.key,
    required this.id,
    required this.nama,
    required this.jlhCore,
    required this.frekuensiDasar,
    required this.tdp,
    required this.img,
  });

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _coreController = TextEditingController();
  final TextEditingController _frekuensiController = TextEditingController();
  final TextEditingController _tdpController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();

    _namaController.text = nama;
    _coreController.text = jlhCore.toString();
    _frekuensiController.text = frekuensiDasar.toString();
    _tdpController.text = tdp.toString();
    _imgController.text = img;

    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      body: ListView(
        physics: const PageScrollPhysics(),
        children: [
          //--- Judul ---//
          const Padding(
            padding: EdgeInsets.only(top: 70.0, left: 32.0, bottom: 50),
            child: Text(
              "Update Prosesor",
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

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //--- Tombol Hapus ---//
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await repository.deleteData(id);

                    if (response) {
                      if (context.mounted) Navigator.pop(context);
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: const Text("Hapus"),
                ),
              ),

              //--- Tombol Update ---//
              Padding(
                padding: const EdgeInsets.only(right: 42),
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await repository.putData(
                      id,
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
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
