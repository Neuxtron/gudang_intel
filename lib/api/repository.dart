import 'dart:convert';
import 'package:gudang_intel/api/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = "https://64300c01c26d69edc8899eef.mockapi.io/api/cpu";

  //--- Create ---//
  Future postData(String nama, int jlhCore, double frekuensiDasar, int tdp,
      String img) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: <String, String>{"content-type": "application/json"},
        body: jsonEncode({
          "nama": nama,
          "jlhCore": jlhCore,
          "frekuensiDasar": frekuensiDasar,
          "tdp": tdp,
          "img": img,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //--- Read ---//
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List jsonData = jsonDecode(response.body) as List;
        List<Cpu> dataCpu = jsonData.map((e) => Cpu.fromJson(e)).toList();
        return dataCpu;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //--- Update ---//
  Future putData(String id, String nama, int jlhCore, double frekuensiDasar,
      int tdp, String img) async {
    try {
      final response = await http.put(
        Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"content-type": "application/json"},
        body: jsonEncode({
          "nama": nama,
          "jlhCore": jlhCore,
          "frekuensiDasar": frekuensiDasar,
          "tdp": tdp,
          "img": img,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //--- Delete ---//
  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse("$_baseUrl/$id"));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
