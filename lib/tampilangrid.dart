import 'package:flutter/material.dart';
import 'package:gudang_intel/api/model.dart';
import 'package:gudang_intel/update.dart';

class TampilanGrid extends StatelessWidget {
  final List<Cpu> dataCpu;
  final Function getData;
  const TampilanGrid({super.key, required this.dataCpu, required this.getData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        physics: const PageScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
        ),
        itemCount: dataCpu.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateCpu(
                    id: dataCpu[index].id,
                    nama: dataCpu[index].nama,
                    jlhCore: dataCpu[index].jlhCore,
                    frekuensiDasar: dataCpu[index].frekuensiDasar,
                    tdp: dataCpu[index].tdp,
                    img: dataCpu[index].img,
                  ),
                ),
              ).then((value) => getData());
            },
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff555555),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Image.network(
                    dataCpu[index].img,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          "Gagal memuat gambar",
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    dataCpu[index].nama,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
