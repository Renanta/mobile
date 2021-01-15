import 'package:flutter/material.dart';
import 'package:tecos_app/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tecos',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.black,
          ),
          button: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Tecos - The Ecosistem",
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ],
                      ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return SignIn();
                                },
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom:100),
                        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Start",
                              style: Theme.of(context).textTheme.button,
                            ),
                            SizedBox(width:10),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

