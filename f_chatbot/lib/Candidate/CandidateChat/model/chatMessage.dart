import 'package:f_chatbot/core/enum/messageEnum.dart';
import 'package:flutter/material.dart';

class ChatMessage{
  final Widget messageContent;
  final MessageEnum messageType;

  ChatMessage(this.messageContent, this.messageType);

}