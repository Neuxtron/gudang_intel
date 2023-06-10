class Cpu {
  final String id;
  final String nama;
  final int jlhCore;
  final double frekuensiDasar;
  final int tdp;
  final String img;

  Cpu({
    required this.id,
    required this.nama,
    required this.jlhCore,
    required this.frekuensiDasar,
    required this.tdp,
    required this.img,
  });

  factory Cpu.fromJson(Map<String, dynamic> json) {
    return Cpu(
      id: json['id'],
      nama: json['nama'],
      jlhCore: json['jlhCore'],
      frekuensiDasar: json['frekuensiDasar'].toDouble(),
      tdp: json['tdp'],
      img: json['img'],
    );
  }
}
