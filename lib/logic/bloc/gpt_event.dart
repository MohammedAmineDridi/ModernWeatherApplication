part of 'gpt_bloc.dart';

@immutable
sealed class GptEvent {}

class GptSendMessageRequestEvent extends GptEvent{
  final messageRequest;
  GptSendMessageRequestEvent({required this.messageRequest});
}

class GptRefreshMessageRequestEvent extends GptEvent{
  GptRefreshMessageRequestEvent();
}