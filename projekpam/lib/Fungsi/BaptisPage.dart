import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/UserPage.dart';


class BaptisPage extends StatefulWidget {
  const BaptisPage({Key? key}) : super(key: key);

  @override
  State<BaptisPage> createState() => _BaptisPageState();
}

class _BaptisPageState extends State<BaptisPage> {
  final formKey = GlobalKey<FormState>();
  // TextEditingController nama_sintua = TextEditingController();
  TextEditingController nama_anak = TextEditingController();
  TextEditingController TempatLahir = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController nama_ayah = TextEditingController();
  TextEditingController nama_ibu = TextEditingController();

  List<String> sintuaList = [
    'Mika Panjaitan',
    'Leomord Sitinjak',
    'Devi Sinaga',
    'Rendi Sibarani',
    'Ray Siagian',
    'Hans Sitinjak',
    'Boston Silalahi',
    'Dwi br.manurung',
  ];
  String? selectedSintua;

  Future<bool> _simpan() async {
    var url =
        'http://192.168.213.42/projekPAM08/GerejaHKBP/create_data_baptis.php';
    var response = await http.post(Uri.parse(url), body: {
      "nama_anak": nama_anak.text,
      "tgl_lahir": tgl_lahir.text,
      "TempatLahir": TempatLahir.text,
      "nama_ayah": nama_ayah.text,
      "nama_ibu": nama_ibu.text,
      "nama_pelayan": selectedSintua,
    });

    if (response.statusCode == 200) {
      print('Sukses: ${response.body}');
      return true;
    } else {
      print('Gagal: ${response.statusCode}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121E65),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Daftar Baptis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey, // Tambahkan key di sini
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 15),
            TextFormField(
              controller: nama_anak,
              decoration: InputDecoration(
                labelText: "Masukan Nama Peserta",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) return "Nama Peserta tidak boleh kosong";
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: tgl_lahir,
              decoration: InputDecoration(
                labelText: "Masukkan Tanggal Lahir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((pickedDate) {
                  if (pickedDate != null) {
                    setState(() {
                      tgl_lahir.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                });
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Tanggal Lahir harus diisi";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: TempatLahir,
              decoration: InputDecoration(
                labelText: "Masukan Tempat Lahir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) return "Data tidak boleh kosong";
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nama_ayah,
              decoration: InputDecoration(
                  labelText: "Masukan Nama Ayah",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value!.isEmpty) return "Data tidak boleh kosong";
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nama_ibu,
              decoration: InputDecoration(
                  labelText: "Masukan Nama Ibu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value!.isEmpty) return "Data tidak boleh kosong";
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedSintua,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSintua = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Masukan Nama Sintua',
              ),
              items: sintuaList.map((String sintua) {
                return DropdownMenuItem<String>(
                  value: sintua,
                  child: Text(sintua),
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
          ],
        ),
      ),
    );
  }
}

void trueSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
