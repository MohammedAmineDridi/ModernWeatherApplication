import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../presentation_layer/screens/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

part 'gpt_event.dart';
part 'gpt_state.dart';

const String GEMINI_API_KEY = "AIzaSyC3Z0lOMPgdAoHwIxJAAoBSlEbk0A6NW64";
final List<Message> messagesList = [];

class GptBloc extends Bloc<GptEvent, GptState> {
  GptBloc() : super(GptInitial()) {
    on<GptEvent>((event, emit) async {
        if (event is GptSendMessageRequestEvent) {
          // request
          String userMessage = event.messageRequest;
          messagesList.add(Message(isUser: true, message: userMessage, date: DateFormat('HH:mm a').format(DateTime.now()) ) );
          // response
          final content = [Content.text(userMessage)];
          final model = GenerativeModel(model: 'gemini-pro', apiKey: GEMINI_API_KEY);
          final respone = await model.generateContent(content);
          messagesList.add(Message(isUser: false, message: respone.text ?? " ", date: DateFormat('HH:mm a').format(DateTime.now()) ) );
          emit(GptUpdatedListMessages(messagesList:messagesList ));
        }
        if (event is GptRefreshMessageRequestEvent ){
          messagesList.clear(); // clear all messages
          emit(GptRefreshedListMessages(messagesList: messagesList));
        }
    });
  }
}
