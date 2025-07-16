import 'package:flutter/material.dart';

class MessageBottomSheet extends StatelessWidget {
  const MessageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
              Navigator.of(context).pop(); // BottomSheet'ten çıkış
              },// Close button functionality can be added later
              alignment: Alignment.topRight,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("Camera",style: TextStyle(fontSize: 20),),
              Spacer(),
              Icon(Icons.camera_alt_outlined, color: Colors.black),
            ],
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Text("Photos and videos",style: TextStyle(fontSize: 20),),
              Spacer(),
              Icon(Icons.image, color: Colors.black),
            ],
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Text("Files",style: TextStyle(fontSize: 20),),
              Spacer(),
              Icon(Icons.file_open, color: Colors.black),
            ],
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Text("Message templates",style: TextStyle(fontSize: 20),),
              Spacer(),
              Icon(Icons.video_file, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
