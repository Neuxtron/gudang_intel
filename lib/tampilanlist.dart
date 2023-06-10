import 'package:flutter/material.dart';
import 'package:gudang_intel/api/model.dart';
import 'package:gudang_intel/update.dart';

class TampilanList extends StatelessWidget {
  final List<Cpu> dataCpu;
  final Function getData;
  const TampilanList({super.key, required this.dataCpu, required this.getData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const PageScrollPhysics(),
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
          child: ListTile(
            title: Text(
              dataCpu[index].nama,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${dataCpu[index].jlhCore} Core   |   ${dataCpu[index].frekuensiDasar}MHz   |   ${dataCpu[index].tdp}W",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
