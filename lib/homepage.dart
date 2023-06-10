import 'package:gudang_intel/api/model.dart';
import 'package:gudang_intel/api/repository.dart';
import 'package:gudang_intel/tambah.dart';
import 'package:gudang_intel/tampilangrid.dart';
import 'package:gudang_intel/tampilanlist.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Tampilan { tampilanList, tampilanGrid }

class _HomePageState extends State<HomePage> {
  List<Cpu> dataCpu = [];
  Repository repository = Repository();
  bool loading = true;

  Tampilan tampilanSelected = Tampilan.tampilanList;
  IconData icon = Icons.grid_view_sharp;

  getData() async {
    loading = true;
    setState(() {
      dataCpu = [];
    });
    dataCpu = await repository.getData();
    loading = false;
    setState(() {});
  }

  toggleView() {
    if (tampilanSelected == Tampilan.tampilanList) {
      setState(() {
        icon = Icons.view_list_sharp;
      });
      tampilanSelected = Tampilan.tampilanGrid;
    } else {
      setState(() {
        icon = Icons.grid_view_sharp;
      });
      tampilanSelected = Tampilan.tampilanList;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget view;

    //--- Tampilan Loading ---//
    if (loading) {
      view = const Center(
        child: Text(
          "Loading...",
          style: TextStyle(color: Colors.white),
        ),
      );

      //--- Tampilan List ---//
    } else if (tampilanSelected == Tampilan.tampilanList) {
      view = TampilanList(
        dataCpu: dataCpu,
        getData: getData,
      );

      //--- Tampilan Grid ---//
    } else {
      view = TampilanGrid(
        dataCpu: dataCpu,
        getData: getData,
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),

      //--- AppBar ---//
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 110,
        backgroundColor: const Color(0xff1e1e1e),
        title: const Padding(
          padding: EdgeInsets.only(top: 50.0, left: 24.0),
          child: Text(
            "Gudang Intel",
            style: TextStyle(fontSize: 36, fontFamily: "Arial-Rounded"),
          ),
        ),
      ),

      //--- Tombol Tambah ---//
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Tambah(),
              )).then((value) => getData());
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //--- Tombol Refresh ---//
              InkWell(
                onTap: getData,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.refresh_outlined,
                    color: Colors.white,
                  ),
                ),
              ),

              //--- Tombol View ---//
              InkWell(
                highlightColor: Colors.transparent,
                onTap: toggleView,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          //--- View ---//
          Expanded(
            child: view,
          ),
        ],
      ),
    );
  }
}
