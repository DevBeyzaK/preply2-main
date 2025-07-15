import 'package:flutter/material.dart';

class Schedulebutton extends StatelessWidget {
  const Schedulebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
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
                child: Text("Schedule",style: TextStyle(fontFamily: "Inter",fontSize: 30,fontWeight: FontWeight.w700),),
              )
              ),
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined,color: Colors.black87,),
                  SizedBox(width: 20,),
                  Text("Lesson",style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                ],
              ),
            ),
            Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.timer_off,color: Colors.black87,),
                  SizedBox(width: 20,),
                  Text("Time off",style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                ],
              ),
            ),
            Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.add,color: Colors.black87,),
                  SizedBox(width: 20,),
                  Text("Extra Slots",style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                ],
              ),
            ),
            Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.schedule_outlined,color: Colors.black87,),
                  SizedBox(width: 20,),
                  Text("Set up availability",style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
  }
