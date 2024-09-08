part of 'gpt_bloc.dart';

@immutable
sealed class GptState {}

final class GptInitial extends GptState {}

class GptUpdatedListMessages extends GptState{
  final List<Message> messagesList;
  GptUpdatedListMessages({required this.messagesList});
}

class GptRefreshedListMessages extends GptState{
  final List<Message> messagesList;
  GptRefreshedListMessages({required this.messagesList});
}

