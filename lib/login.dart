import 'package:flutter/material.dart';
import 'package:preply_clone/giris.dart';
import 'package:preply_clone/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 121, 172, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/preplylogo.png",
          width: 180,
          height: 180,
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: Text("Pratik yap, hedefine   ulaş.",style: TextStyle(fontFamily:'Inter',fontSize: 60, fontWeight: FontWeight.w900,),),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Şimdi, başlamak için en iyi zaman. Yeni bir şey öğrenmeye hazır mısın?",
              style: TextStyle(
                color: const Color.fromARGB(255, 30, 30, 30),
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(194, 95, 134, 1)
                ),
              ),
              SizedBox(width: 5,),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(194, 95, 134, 1)
                ),
              ),
              SizedBox(width: 5,),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 39, 39, 39),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            }, child: Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Hemen başla", style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
              Icon(Icons.arrow_right_alt, color: Colors.white, size: 30,),
            ],),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(18, 17, 24, 1),
              padding: EdgeInsets.symmetric( vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Giris(),));
              },
               child: Text("Giriş yap",style: TextStyle(color: Colors.black,
                fontSize: 20, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, decorationColor: Colors.black,  
               ),),),
            ),
          )

          
        ],
      ),
    );
  }
}