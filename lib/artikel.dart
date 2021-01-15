import 'package:flutter/material.dart';

class artikel extends StatefulWidget {
  @override
  _artikelState createState() => _artikelState();
}

class _artikelState extends State<artikel> {
  Widget atas() {
    return AppBar(
      title: Text(
        'Artikel',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  var artikel1 = [
    'Cara Melestarikan Hewan',
    'Hewan dan tumbuhan langka karena waktu pertumbuhan yang lama. Banyak di antara hewan dan tumbuhan yang langka memiliki tubuh besar atau lama bertumbuhnya. Contohnya komodo yang membutuhkan lima tahun untuk bisa mencapai panjang 3 meter. Padahal umurnya hanya 30 tahun.',];
  var artikel2 = ['cara melestarikan tumbuhan', 'Hewan dan tumbuhan menjadi langka karena habitatnya terancam oleh manusia. Dengan semakin banyaknya populasi manusia, maka semakin tinggi kebutuhan dan ruang yang dibutuhkan. Hutan yang menjadi rumah hewan dan tumbuhan pun dialihkan untuk memenuhi kebutuhan manusia.'];
  var show = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: atas(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text('Cara Menjaga Kelestarian Hewan',
              style: TextStyle(color: Colors.blue, fontSize: 25)),
          Container(
            height: 80,
            child: ListView(
              children: artikel1.map((e) {
                return Padding(
                  child: Text(e),
                  padding: EdgeInsets.only(top: 5.0, left: 20.0),
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Lihat Artikel'),
            color: Colors.green,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text('Cara melestarikan tumbuhan', style: TextStyle(color: Colors.blue, fontSize: 25)),
          Container(
            height: 80,
            child: ListView(
              children: artikel2.map((e) {
                return Padding(
                  child: Text(e),
                  padding: EdgeInsets.only(top: 5.0, left: 20.0),
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Lihat Artikel'),
            color: Colors.green,
          ),
        ],
      ),

    );
  }
}