import '../../logic/bloc/gpt_bloc.dart';
import '../screens/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController requestMessageController = new TextEditingController();

class GPTPage extends StatelessWidget {

  const GPTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Row(children: [
            SizedBox(width: 30),  
            Text('ChatGPT App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            SizedBox(width: 60),
            IconButton(onPressed: (){
                print("refresh the messages");
                BlocProvider.of<GptBloc>(context).add(GptRefreshMessageRequestEvent());
            }, icon: Icon(Icons.refresh)),
          ],),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF673AB7), Color(0xFFFFAB40)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-160,
              child: BlocBuilder<GptBloc,GptState>(
              builder: (context,state) {
              if (state is GptUpdatedListMessages){
                return ListView.builder(
                    itemCount: state.messagesList.length,
                    itemBuilder: (context,index){
                        final message = state.messagesList[index];
                        return Message(isUser: message.isUser, message: message.message, date: message.date);
                  });
              }
              if (state is GptRefreshedListMessages){
                return ListView.builder(
                    itemCount: state.messagesList.length,
                    itemBuilder: (context,index){
                        final message = state.messagesList[index];
                        return Message(isUser: message.isUser, message: message.message, date: message.date);
                  });
              }
              return SizedBox();
              }         
              )
            ),
            Container(
              padding: EdgeInsets.all(15),
              child:Row(
                children: [
                Expanded(child:TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: requestMessageController,
                decoration: InputDecoration(
                  labelText: 'Enter your Message',
                  hintText: 'Type your Message ...',
                  hintStyle: TextStyle(color:Color(0xFF673AB7)),
                  labelStyle: TextStyle(color:Color(0xFF673AB7)),
                  border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xFF673AB7), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xFF673AB7), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xFF673AB7), width: 1.0),
                      ),
                  prefixIcon: Icon(Icons.smart_toy_outlined,color: Color(0xFF673AB7)),
                ),
                onChanged: (text) {
                  print('Text field input: $text');
                },
              )),
              SizedBox(width: 5),
                  IconButton(onPressed: () async {
                      print("send request to AI Model");
                      BlocProvider.of<GptBloc>(context).add(GptSendMessageRequestEvent(messageRequest: requestMessageController.text));
                  }, icon: Icon(Icons.send,color: Color(0xFF673AB7),size: 30))
              ],)
            )
          ],
        )
        )
    );
  }
}