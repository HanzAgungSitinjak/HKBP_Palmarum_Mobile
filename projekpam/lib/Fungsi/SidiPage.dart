import 'package:flutter/material.dart';
import 'package:projekpam/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekpam/UserPage.dart';
import 'package:http/http.dart' as http;


class SidiPage extends StatefulWidget {
  const SidiPage({Key? key}) : super(key: key);

  @override
  State<SidiPage> createState() => _SidiPageState();
}

class _SidiPageState extends State<SidiPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama_anak = TextEditingController();
  TextEditingController TempatLahir = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController tgl_baptis = TextEditingController();
  TextEditingController nama_ayah = TextEditingController();
  TextEditingController nama_ibu = TextEditingController();

  Future<bool> _simpan() async {
    // DateTime? pickedDate = DateTime.parse(tgl_lahir.text);
    // // var formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    var url = 'http://192.168.213.42/projekPAM08/GerejaHKBP/create_data_sidi.php';
    var respone = await http.post(Uri.parse(url), body: {
      "nama_anak": nama_anak.text,
      "tgl_lahir": tgl_lahir.text,
      "tgl_baptis": tgl_baptis.text,
      "TempatLahir": TempatLahir.text,
      "nama_ayah": nama_ayah.text,
      "nama_ibu": nama_ibu.text,

    });
    if (respone.statusCode == 200) {
      print('Sukses: ${respone.body}');
      return true;
    } else {
      print('Gagal: ${respone.statusCode}');
      return false;
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121E65),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Daftar Sidi',
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
              controller: nama_anak,
              decoration: InputDecoration(
                labelText:"Masukan Nama Peserta",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return "Nama Peserta tidak boleh kosong";
              },
            ),
            SizedBox(
              height: 20,
            ),

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
                      tgl_lahir.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                });
              },
              validator: (value) {
                if (value?.isEmpty?? true) {
                  return "Tanggal Lahir harus diisi";
                }
                return null;
              },
            ),//textformdate
            SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: tgl_baptis,
              decoration: InputDecoration(
                labelText: "Masukkan Tanggal Baptis",
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
                      tgl_baptis.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                });
              },
              validator: (value) {
                if (value?.isEmpty?? true) {
                  return "Tanggal Lahir harus diisi";
                }
                return null;
              },
            ),//textformdate2

            SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: TempatLahir,
              decoration: InputDecoration(
                labelText:"Masukan Tempat Lahir",
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
              controller: nama_ayah,
              decoration: InputDecoration(
                  labelText:"Masukan Nama Ayah",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value!.isEmpty)
                  return "Data tidak boleh kosong";

              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nama_ibu,
              decoration: InputDecoration(
                  labelText:"Masukan Nama Ibu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value!.isEmpty)
                  return "Data tidak boleh kosong";

              },
            ),
            SizedBox(
              height: 30,
            ),

            // TextFormField(
            //   controller: pekerjaan,
            //   decoration: InputDecoration(
            //     labelText:"Masukan Pekerjaan Anda",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   validator: (value) {
            //     if (value!.isEmpty)
            //       return "Data tidak boleh kosong";
            //
            //   },
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // // TextFormField(
            // //   controller: lingkungan,
            // //   decoration: InputDecoration(
            // //       labelText:"Masukan Lingkungan Anda",
            // //       border: OutlineInputBorder(
            // //           borderRadius: BorderRadius.circular(20))),
            // //   validator: (value) {
            // //     if (value!.isEmpty)
            // //       return "Data tidak boleh kosong";
            // //
            // //   },
            // // ),
            // // SizedBox(
            // //   height: 20,
            // // ),
            // DropdownButtonFormField<String>(
            //   value: selectedLingkungan,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedLingkungan = newValue;
            //     });
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Masukan Lingkungan',
            //   ),
            //   items: lingkunganList.map((String lingkungan) {
            //     return DropdownMenuItem<String>(
            //       value: lingkungan,
            //       child: Text(lingkungan),
            //     );
            //   }).toList(),
            // ),
            // SizedBox(height: 16.0),
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



        // child: Container(
        //   padding: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //
        //       SizedBox(
        //         height: 15,
        //       ),
        //       TextFormField(
        //         controller: nama_anak,
        //         decoration: InputDecoration(
        //           labelText:"Masukan Nama Peserta",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //         validator: (value) {
        //           if (value!.isEmpty)
        //             return "Nama Peserta tidak boleh kosong";
        //         },
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       TextFormField(
        //         controller: tgl_lahir,
        //         decoration: InputDecoration(
        //           labelText: "Masukkan Tanggal Lahir",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //         onTap: () {
        //           showDatePicker(
        //             context: context,
        //             initialDate: DateTime.now(),
        //             firstDate: DateTime(2000),
        //             lastDate: DateTime(2100),
        //           ).then((pickedDate) {
        //             if (pickedDate != null) {
        //               setState(() {
        //                 tgl_lahir.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        //               });
        //             }
        //           });
        //         },
        //         validator: (value) {
        //           if (value?.isEmpty?? true) {
        //             return "Tanggal Lahir harus diisi";
        //           }
        //           return null;
        //         },
        //       ),//textformdate
        //
        //       SizedBox(
        //         height: 20,
        //       ),
        //
        //       TextFormField(
        //         controller: tgl_baptis,
        //         decoration: InputDecoration(
        //           labelText: "Masukkan Tanggal Baptis",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //         onTap: () {
        //           showDatePicker(
        //             context: context,
        //             initialDate: DateTime.now(),
        //             firstDate: DateTime(2000),
        //             lastDate: DateTime(2100),
        //           ).then((pickedDate) {
        //             if (pickedDate != null) {
        //               setState(() {
        //                 tgl_baptis.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        //               });
        //             }
        //           });
        //         },
        //         validator: (value) {
        //           if (value?.isEmpty?? true) {
        //             return "Tanggal Lahir harus diisi";
        //           }
        //           return null;
        //         },
        //       ),//textformdate2
        //
        //       SizedBox(
        //         height: 20,
        //       ),
        //       TextFormField(
        //         controller: TempatLahir,
        //         decoration: InputDecoration(
        //           labelText:"Masukan Tempat Lahir",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //         validator: (value) {
        //           if (value!.isEmpty)
        //             return "Data tidak boleh kosong";
        //
        //         },
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       TextFormField(
        //         controller: nama_ayah,
        //         decoration: InputDecoration(
        //             labelText:"Masukan Nama Ayah",
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(20))),
        //         validator: (value) {
        //           if (value!.isEmpty)
        //             return "Data tidak boleh kosong";
        //
        //         },
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       TextFormField(
        //         controller: nama_ibu,
        //         decoration: InputDecoration(
        //             labelText:"Masukan Nama Ibu",
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(20))),
        //         validator: (value) {
        //           if (value!.isEmpty)
        //             return "Data tidak boleh kosong";
        //
        //         },
        //       ),
        //       SizedBox(
        //         height: 30,
        //       ),
        //       ElevatedButton(
        //
        //           style: ElevatedButton.styleFrom(
        //             minimumSize: Size(double.infinity, 60), // Atur lebar dan tinggi tombol di sini
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(20)),
        //           ),
        //           onPressed: () {
        //             if (formKey.currentState!.validate()) {
        //               _simpan().then((value) {
        //                 if (value) {
        //                   final snackBar = SnackBar(
        //                     content: const Text('Data Berhasil Di Simpan!'),
        //                   );
        //                   ScaffoldMessenger.of(context)
        //                       .showSnackBar(snackBar);
        //                 } else {
        //                   final snackBar = SnackBar(
        //                     content: const Text('Data Gagal Di Simpan!'),
        //                   );
        //                   ScaffoldMessenger.of(context)
        //                       .showSnackBar(snackBar);
        //                 }
        //               });
        //               Navigator.pushAndRemoveUntil(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: ((context) => UserPage())),
        //                       (route) => false);
        //             }
        //           },
        //           child: Text("Simpan data")
        //       ),
        //     ],
        //   ),
        // ),





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