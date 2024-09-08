import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Message({super.key, required this.isUser , required this.message , required this.date});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color:isUser ? const Color.fromARGB(255, 9, 37, 60) : Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical:15).copyWith(
        left: isUser ? 200:10,
        right: isUser ? 10:200
      ),
      // body (message text)
      child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
          Text(message,style: TextStyle(color:isUser?Colors.white:Colors.black,fontWeight: FontWeight.bold)),
          Text(date,style: TextStyle(color:isUser?Colors.white:Colors.black)),
      ]),
    );
    
  }
}