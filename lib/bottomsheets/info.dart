import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      decoration: BoxDecoration(
       color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){
                Navigator.pop(context); 
              }, icon: Icon(Icons.close))),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 20),
                child: Text("Calendar tags",style: TextStyle(fontFamily: "Inter",fontSize: 25),),
              )
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 40,
                    color: Colors.green.shade900,
                  ),
                  SizedBox(width: 10,),
                  Text("First lesson",style: TextStyle(fontSize: 15),),
                  SizedBox(width: 100,),
                  Container(
                    width: 5,
                    height: 40,
                    color: Colors.blue.shade900,
                  ),
                  SizedBox(width: 10,),
                  Text("Single lesson",style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 40,
                    color: Colors.pink.shade900,
                  ),
                  SizedBox(width: 10,),
                  Text("Weekly lesson",style: TextStyle(fontSize: 15),),
                  SizedBox(width: 80,),
                  Container(
                    width: 5,
                    height: 40,
                    color: Colors.brown,
                  ),
                  SizedBox(width: 10,),
                  Text("Time off",style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 40,
                    color: Colors.grey.shade900,
                  ),
                  SizedBox(width: 10,),
                  Text("Google Calendar",style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Lesson status",style: TextStyle(fontFamily: "Inter",fontSize: 25),),
              )),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.more_time,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text("Awaiting confirmation",style: TextStyle(fontSize: 15),),
                ],
              ), 
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text("Confirmed lesson",style: TextStyle(fontSize: 15),),
                  SizedBox(height: 5,),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.block,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text("Cancelled & paid",style: TextStyle(fontSize: 15),),
                  SizedBox(height: 5,),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.attach_money_outlined,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text("Payment Requested",style: TextStyle(fontSize: 15),),
                  SizedBox(height: 5,),
                ],
              ),
          ],
        ),
      ),
    );
  }
}