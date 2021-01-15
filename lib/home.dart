import 'package:flutter/material.dart';

import 'anggota.dart';
import 'map.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.green,
                    Colors.white,
                  ],
                ),
                image:DecorationImage(
                  image: AssetImage("assets/image/leaf.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
            child: Column(
              children: <Widget>[
                listCard(
                  name : "Lokasi",
                  press: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return Maps();
                        },
                      ),
                    );
                  },
                ),
                listCard(
                  name : "Anggota",
                  press: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return Members();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(
      size.width / 2, size.height , size.width ,size.height-80 );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}


class listCard extends StatelessWidget {
  final String name;
  final Function press;
  const listCard({
    Key key,
    this.name,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical:30, horizontal: 30),
      margin: EdgeInsets.only(bottom:16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 33,
            color: Colors.white,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children:[
                TextSpan(
                  text: "$name\n",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: press
          ),
        ],
      ),
    );
  }
}
