import 'package:flutter/material.dart';
import 'package:projekpam/utils/global.colors.dart';
import 'package:projekpam/Data/dataBaptis.dart';
import 'package:projekpam/Data/dataSidi.dart';

class dataKegiatan extends StatelessWidget {
  const dataKegiatan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121E65),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Daftar Kegiatan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body:
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 15),
          Container(
              alignment: AlignmentDirectional.centerStart,
              width: 450.0,
              height: 170.0,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: GlobalColors.mainColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: GlobalColors.secondColor,
                  width: 2.0,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 13.0),
                    child: Text(
                      'Daftar Peserta Baptis',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Lihat Peserta Baptis',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => dataBaptis(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text('Lihat'),
                  ),
                ],
              ),
            ),//conteiner1
            const SizedBox(height: 15),
              Container(
                alignment: AlignmentDirectional.centerStart,
                width: 450.0,
                height: 170.0,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: GlobalColors.mainColor,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: GlobalColors.secondColor,
                    width: 2.0,
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 13.0),
                      child: Text(
                        'Daftar Peserta Sidi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Lihat Peserta Sidi',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => dataSidi(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text('Lihat'),
                    ),
                  ],
                ),
              ),
          ],//children
        ),//column
    );
  }
}
