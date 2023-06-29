import 'package:flutter/material.dart';
import 'package:projekpam/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekpam/UserPage.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/Services/globals.dart';

class DaftarJemaat extends StatefulWidget {
  const DaftarJemaat({Key? key}) : super(key: key);

  @override
  State<DaftarJemaat> createState() => _DaftarJemaatState();
}

class _DaftarJemaatState extends State<DaftarJemaat> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama_jemaat = TextEditingController();
  TextEditingController pendidikan = TextEditingController();
  TextEditingController bidangPendidikan = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController lingkungan = TextEditingController();
  TextEditingController alamat = TextEditingController();

  List<String> lingkunganList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  String? selectedLingkungan;

  Future<bool> _simpan() async {
    // DateTime? pickedDate = DateTime.parse(tgl_lahir.text);
    // // var formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    var url = 'http://192.168.213.42/projekPAM08/GerejaHKBP/tambah_jemaat.php';
    var respone = await http.post(Uri.parse(url), body: {
      "nama_jemaat": nama_jemaat.text,
      "pendidikan": pendidikan.text,
      "bidangPendidikan": bidangPendidikan.text,
      "pekerjaan": pekerjaan.text,
      "alamat": alamat.text,
      "id_lingkungan": selectedLingkungan,

    });
    if (respone.statusCode == 200) {
      print('Sukses: ${respone.body}');
      return true;
    } else {
      print('Gagal: ${respone.statusCode}');
      return false;
    }
  }

  // @override
  // void initState(){
  //   tgl_lahir.text="";
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    MaterialColor myCustomColor = MaterialColor(0xFF121E65, // Nilai utama warna
      <int, Color>{
        50: Color(0xFF121E65), // Nilai warna untuk shade 50
        100: Color(0xFF345678), // Nilai warna untuk shade 100
        200: Color(0xFF456789), // Nilai warna untuk shade 200
        300: Color(0xFF56789A), // Nilai warna untuk shade 300
        400: Color(0xFF6789AB), // Nilai warna untuk shade 400
        500: Color(0xFF789ABC), // Nilai warna untuk shade 500 (primary color)
        600: Color(0xFF89ABCD), // Nilai warna untuk shade 600
        700: Color(0xFF9ABCDE), // Nilai warna untuk shade 700
        800: Color(0xFFABCDEF), // Nilai warna untuk shade 800
        900: Color(0xFFBCDEF0), // Nilai warna untuk shade 900
      },
    );

    // nama_anak.text = widget.ListData['nama_anak'];
    // TempatLahir.text = widget.ListData['TempatLahir'];
    // tgl_lahir.text = widget.ListData['tgl_lahir'];
    // nama_ayah.text = widget.ListData['nama_ayah'];
    // nama_ibu.text = widget.ListData['nama_ibu'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121E65),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Daftar Jemaat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),//AppBar

      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: nama_jemaat,
              decoration: InputDecoration(
                labelText:"Masukan Nama Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Nama Anda Tidak boleh kosong";

              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: pendidikan,
              decoration: InputDecoration(
                labelText:"Masukan Pendidikan Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Data Tidak boleh kosong";

              },
            ),//pendidikan
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: bidangPendidikan,
              decoration: InputDecoration(
                labelText:"Masukan Data pendidikan anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Alamat Anda Tidak boleh kosong";

              },
            ),//data pendidikan
            SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: pekerjaan,
              decoration: InputDecoration(
                labelText:"Masukan Pekerjaan Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Data tidak boleh kosong";

              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: alamat,
              decoration: InputDecoration(
                labelText:"Masukan Alamat Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Data tidak boleh kosong";

              },
            ),
            SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   controller: lingkungan,
            //   decoration: InputDecoration(
            //       labelText:"Masukan Lingkungan Anda",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20))),
            //   validator: (value) {
            //     if (value!.isEmpty)
            //       return "Data tidak boleh kosong";
            //
            //   },
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            DropdownButtonFormField<String>(
              value: selectedLingkungan,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLingkungan = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Masukan Lingkungan',
              ),
              items: lingkunganList.map((String lingkungan) {
                return DropdownMenuItem<String>(
                  value: lingkungan,
                  child: Text(lingkungan),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Validasi'),
                      content: Text(
                          'Data yang dimasukan sudah benar? Jika ada kesalahan anda harus memperbaikinya ke pengurus setempat'),
                      actions: [
                        TextButton(
                          child: Text('Ya'),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _simpan().then((value) {
                                if (value) {
                                  trueSnackBar(context, 'Berhasil');
                                } else {
                                  final snackBar = SnackBar(
                                    content:
                                    const Text('Data Gagal Di Simpan!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => UserPage())
                                ),
                                    (route) => false,
                              );
                            }
                          },
                        ),
                        TextButton(
                          child: Text('Tidak'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Simpan data"),
            ),
          ], //children
        ),//listview
      ),//Form
    );//Scaffload
  }//Widget
}

void trueSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
