import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/Data/Baptis.dart';

class dataBaptis extends StatefulWidget {
  @override
  _dataBaptisState createState() => _dataBaptisState();
}

class _dataBaptisState extends State<dataBaptis> {
  late List<Baptis> baptisList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.213.42/projekPAM08/GerejaHKBP/read.php'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final dataList = jsonData.map((item) => Baptis(
        nama: item['nama_anak'],
        tempatLahir: item['TempatLahir'],
      )).toList();

      setState(() {
        baptisList = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data peserta baptis'),
        backgroundColor: Color(0xFF121E65),
      ),
      body: ListView.builder(
        itemCount: baptisList.length,
        itemBuilder: (context, index) {
          final baptis = baptisList[index];
          return ListTile(
            title: Text(baptis.nama),
            subtitle: Text(baptis.tempatLahir),
          );
        },
      ),
    );
  }
}
