import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/Data/dataSidi.dart';
import 'package:projekpam/DataLingkungan/Lingkungan.dart';

class data_lingkungan3 extends StatefulWidget {
  const data_lingkungan3({Key? key}) : super(key: key);

  @override
  State<data_lingkungan3> createState() => _data_lingkungan3State();
}

class _data_lingkungan3State extends State<data_lingkungan3> {
  late List<Lingkungan> lingkungan3List = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.213.42/projekPAM08/GerejaHKBP/lingkungan3.php'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final dataList = jsonData.map((item) => Lingkungan(
        nama: item['nama_jemaat'],
        alamat: item['alamat'],
      )).toList();

      setState(() {
        lingkungan3List = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data jemaat Lingkungan 3'),
        backgroundColor: Color(0xFF121E65),
      ),
      body: ListView.builder(
        itemCount: lingkungan3List.length,
        itemBuilder: (context, index) {
          final lingkungan3 = lingkungan3List[index];
          return ListTile(
            title: Text(lingkungan3.nama),
            subtitle: Text(lingkungan3.alamat),
          );
        },
      ),
    );
  }
}
