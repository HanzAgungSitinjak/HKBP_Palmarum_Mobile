import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Login_Page.dart';
import 'dart:convert';
import 'package:projekpam/utils/global.colors.dart';
import 'package:projekpam/Fungsi/BaptisPage.dart';
import 'package:projekpam/Fungsi/SidiPage.dart';
import 'package:projekpam/Fungsi/DaftarJemaatPage.dart';
import 'package:projekpam/Data/dataKegiatan.dart';
import 'package:projekpam/Data/dataLingkungan.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor myCustomColor = MaterialColor(0xFF121E65,// Nilai utama warna
      <int, Color>{
        50: Color(0xFF121E65), // Nilai warna untuk shade 50
        100: Color(0xFFC2DE11), // Nilai warna untuk shade 100
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: myCustomColor,
      ),
      home: const UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width:120.0,
          height: 36,
          child:ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Keluar'),
                    content: Text('Apakah Anda ingin keluar?'),
                    actions: [
                      TextButton(
                        child: Text('Ya'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const Login_Page(),
                              ));
                          // Navigator.of(context).pop(true);
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  // side: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ),
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Keluar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ),
          ),
        ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: GlobalColors.mainColor,

            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Selamat datang', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 35.0,
                  )),
                  subtitle: Text('di Aplikasi HKBP Palmarum', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                      backgroundColor:Colors.white,
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),

          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(60)
                  // )

              ),
                child: SingleChildScrollView(
                  child: Column(
                    children:[
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/8/85/HKBP_Palmarum%2C_Res._Palmarum_02.jpg',
                        width: 500,
                        height: 400,
                      ),//Image

                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 470.0, // Ubah lebar sesuai kebutuhan
                        height: 350.0, // Ubah tinggi sesuai kebutuhan

                        // decoration: BoxDecoration(
                        //   color: Colors.white, // Ubah warna latar belakang sesuai kebutuhan
                        //   borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                        //   border: Border.all(
                        //     color: GlobalColors.mainColor, // Ubah warna tepi sesuai kebutuhan
                        //     width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                        //   ),
                        // ),

                        child: Column(
                          children:[
                            Text(
                              '    Gereja HKBP Palmarum Tarutung adalah sebuah gereja Protestan yang terletak di kota Tarutung, Kabupaten Tapanuli Utara, Sumatera Utara, Indonesia. Gereja ini merupakan bagian dari Huria Kristen Batak Protestan (HKBP), sebuah denominasi gereja Kristen Protestan terbesar di Indonesia yang didirikan oleh misionaris Jerman pada abad ke-19.',
                              style: TextStyle(
                                fontSize: 13,
                                color: GlobalColors.mainColor,

                              ), // TextStyle
                            ), //Text
                            const SizedBox(height:5),
                            Text(
                              '   HKBP Palmarum Tarutung adalah salah satu gereja Protestan terbesar di daerah tersebut. Gereja ini memiliki peran penting dalam kehidupan rohani dan sosial masyarakat Tarutung dan sekitarnya. Gereja ini melayani umat Kristen Batak dengan berbagai kegiatan keagamaan, seperti ibadah mingguan, kebaktian khusus, sekolah minggu, kelas Katekisasi, dan kelompok persekutuan.',
                              style: TextStyle(
                                fontSize: 13,
                                color: GlobalColors.mainColor,

                              ), // TextStyle
                            ), //Text
                            const SizedBox(height:5),
                            Text(
                              '   Gereja HKBP Palmarum Tarutung memiliki gedung gereja yang merupakan tempat diadakannya ibadah dan kegiatan gereja lainnya. Sebagai gereja Protestan, HKBP Palmarum Tarutung mengikutsertakan jemaat dalam berbagai kegiatan sosial dan pelayanan, termasuk pelayanan sosial kepada masyarakat yang membutuhkan, pendidikan, dan pembangunan karakter Kristen.',
                              style: TextStyle(
                                fontSize: 13,
                                color: GlobalColors.mainColor,

                              ), // TextStyle
                            ), //Text

                          ],
                        ),//columnRow


                      ),//container
                      const SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 450.0, // Ubah lebar sesuai kebutuhan
                        height: 135.0, // Ubah tinggi sesuai kebutuhan

                        decoration: BoxDecoration(
                          color: Colors.white, // Ubah warna latar belakang sesuai kebutuhan
                          borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                          border: Border.all(
                            color: GlobalColors.mainColor, // Ubah warna tepi sesuai kebutuhan
                            width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[

                            Text(
                              'Data Umum Gereja',
                              style: TextStyle(
                                fontSize: 20,
                                color: GlobalColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ), // TextStyle
                            ), //Text
                            const SizedBox(height:5),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    // Properti-properti Container diatur di sini
                                    // color: GlobalColors.mainColor,
                                    padding: EdgeInsets.all(10.0),
                                    width: 0.0, // Ubah lebar sesuai kebutuhan
                                    height: 80.0,
                                    // decoration: BoxDecoration(
                                    //   color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                                    //   borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                                    //   border: Border.all(
                                    //     color: GlobalColors.mainColor, // Ubah warna tepi sesuai kebutuhan
                                    //     width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                                    //   ),
                                    // ),
                                    child:ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>const dataKegiatan(),
                                            ));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue, // Atur warna latar belakang tombol di sini
                                      ),
                                      child: Text('Daftar Kegiatan'),
                                    ),
                                  ),
                                ),//expanded
                                // Container(
                                //   // Properti-properti Container diatur di sini
                                //   // color: GlobalColors.mainColor,
                                //   margin: EdgeInsets.all(10.0),
                                //   padding: EdgeInsets.all(10.0),
                                //   child: Text('Widget 1'),
                                //   width: 125.0, // Ubah lebar sesuai kebutuhan
                                //   height: 60.0,
                                //
                                //   decoration: BoxDecoration(
                                //     color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                                //     borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                                //     border: Border.all(
                                //       color: GlobalColors.mainColor, // Ubah warna tepi sesuai kebutuhan
                                //       width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                                //     ),
                                //   ),
                                //
                                // ),
                                Container(
                                  // Properti-properti Container diatur di sini
                                  // color: GlobalColors.mainColor,
                                  padding: EdgeInsets.all(10.0),
                                  width: 180.0, // Ubah lebar sesuai kebutuhan
                                  height: 80.0,
                                  // decoration: BoxDecoration(
                                  //   color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                                  //   borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                                  //   border: Border.all(
                                  //     color: GlobalColors.mainColor, // Ubah warna tepi sesuai kebutuhan
                                  //     width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                                  //   ),
                                  // ),
                                  child:ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => dataLingkungan(),
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue, // Atur warna latar belakang tombol di sini
                                    ),
                                    child: Text('Daftar Jemaat Gereja',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),//Row
                          ],
                        ),//columnRow


                      ),//container
                      const SizedBox(height: 30),
                      Text(
                        'Fitur yang disediakan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: GlobalColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ), // TextStyle
                      ), //Text
                      const SizedBox(height: 30),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: 450.0, // Ubah lebar sesuai kebutuhan
                        height: 170.0, // Ubah tinggi sesuai kebutuhan
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                          borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // mengatur offset bayangan (x, y)
                            ),
                          ],
                          border: Border.all(
                            color: GlobalColors.secondColor, // Ubah warna tepi sesuai kebutuhan
                            width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                          ),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 13.0), // Atur padding untuk setiap sisi di sini
                              child: Text(
                                'Daftar Baptis',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ), // TextStyle
                              ), //Text
                            ),//paddingTitle

                            Text(
                              'Request Pendaftaran Baptis',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ), // TextStyle
                            ), //Text
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const BaptisPage(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Atur warna latar belakang tombol di sini
                              ),
                              child: Text('Daftar Sekarang'),
                            ),
                          ],//children
                        ),//column1
                      ),//container
                      const SizedBox(height: 30),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: 450.0, // Ubah lebar sesuai kebutuhan
                        height: 170.0, // Ubah tinggi sesuai kebutuhan
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                          borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // mengatur offset bayangan (x, y)
                            ),
                          ],
                          border: Border.all(
                            color: GlobalColors.secondColor, // Ubah warna tepi sesuai kebutuhan
                            width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                          ),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 13.0), // Atur padding untuk setiap sisi di sini
                              child: Text(
                                'Daftar Sidi',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ), // TextStyle
                              ), //Text
                            ),//paddingTitle

                            Text(
                              'Request Pendaftaran Sidi',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ), // TextStyle
                            ), //Text
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: ()
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const SidiPage(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Atur warna latar belakang tombol di sini
                              ),
                              child: Text('Daftar Sekarang'),
                            ),
                          ],//children
                        ),//column2
                      ),//container
                      const SizedBox(height: 30),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: 450.0, // Ubah lebar sesuai kebutuhan
                        height: 170.0, // Ubah tinggi sesuai kebutuhan
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor, // Ubah warna latar belakang sesuai kebutuhan
                          borderRadius: BorderRadius.circular(8.0), // Ubah radius sudut sesuai kebutuhan
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // mengatur offset bayangan (x, y)
                            ),
                          ],
                          border: Border.all(
                            color: GlobalColors.secondColor, // Ubah warna tepi sesuai kebutuhan
                            width: 2.0, // Ubah lebar tepi sesuai kebutuhan
                          ),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 13.0), // Atur padding untuk setiap sisi di sini
                              child: Text(
                                'Daftar Sebagai Jemaat',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ), // TextStyle
                              ), //Text
                            ),//paddingTitle

                            Text(
                              'Request Daftar Jemaat',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ), // TextStyle
                            ), //Text
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const DaftarJemaat(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue, // Atur warna latar belakang tombol di sini
                              ),
                              child: Text('Daftar Sekarang'),
                            ),
                          ],//children
                        ),//column3
                      ),//container
                      const SizedBox(height: 30),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
