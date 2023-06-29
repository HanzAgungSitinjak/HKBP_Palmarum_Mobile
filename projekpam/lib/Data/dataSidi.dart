import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/Data/Sidi.dart';

class dataSidi extends StatefulWidget {
  @override
  _dataSidiState createState() => _dataSidiState();
}

class _dataSidiState extends State<dataSidi> {
  late List<Sidi> sidiList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.213.42/projekPAM08/GerejaHKBP/read_sidi.php'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final dataList = jsonData.map((item) => Sidi(
        nama: item['nama_anak'],
        tanggalBaptis: item['tgl_baptis'],
      )).toList();

      setState(() {
        sidiList = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data peserta Sidi'),
        backgroundColor: Color(0xFF121E65),
      ),
      body: ListView.builder(
        itemCount: sidiList.length,
        itemBuilder: (context, index) {
          final sidi = sidiList[index];
          return ListTile(
            title: Text(sidi.nama),
            subtitle: Text(sidi.tanggalBaptis),
          );
        },
      ),
    );
  }
}
