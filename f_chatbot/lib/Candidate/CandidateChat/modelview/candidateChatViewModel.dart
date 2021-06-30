import 'package:f_chatbot/Candidate/CandidateChat/model/chatMessage.dart';
import 'package:f_chatbot/Candidate/CandidateChat/view/candidateChat.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/enum/messageEnum.dart';
import 'package:flutter/material.dart';

abstract class CandidateChatViewModel extends BaseStateFull<CandidateChat> {
  late final TextEditingController cMessage;
  late final ScrollController controller;
  List<ChatMessage> chatBotLive = [
    ChatMessage(
        "Merhabalar! Uygulamaya hoşgeldin :) Konuşmaya hazır mısın? Eğer hazırsan bu soruya evet cevabını vererek başlayabilirsin.",
        MessageEnum.RECEIVER),
  ];
  List<String> candidateAnswers = [];
  var messageIndex = 0;

  void sendMessage(String message) {
    String senderMessage = "Sanırım yazı yazmayı unuttunuz ? :D";
    setState(() {
      if (message != "") {
        cMessage.text = "";
        switch (messageIndex) {
          case 0:
            if (["evet", "hazırım", "yes", "hazirim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;

              senderMessage = chatBotMessages[messageIndex].messageContent;
            } else {
              senderMessage =
                  "Sanırım hazır değilsin. İstersen biraz derin nefes al. Hazır olduğunda tekrardan hazırım diyebilirsin";
            }
            break;
          case 1:
            if (message.split(" ").length == 2 ||
                message.split(" ").length == 3) {
              messageIndex += 1;
              candidateAnswers.add(message);
              senderMessage = chatBotMessages[messageIndex].messageContent;
            } else {
              senderMessage =
                  "Sanırım birileri adını soyadını yazamamış. Sana biraz yardımcı olmak isterim. Örneğin: Burak YILDIZ şeklinde yazabilirsin :) ";
            }
            break;

          case 2:
            if (["erkek", "kadın", "kız"].contains(message.toLowerCase())) {
              if (message.toLowerCase() == "erkek") {
                messageIndex += 1;
              } else {
                messageIndex += 2;
              }

              candidateAnswers.add(message.toLowerCase());
              senderMessage = chatBotMessages[messageIndex].messageContent;
            } else {
              senderMessage =
                  "Lütfen cinsiyeti doğru yazar mısın?(erkek/kadın)";
            }
            break;

          case 3:
            if (["evet", "yaptım", "yapdım", "yapmadim", "yaptim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              senderMessage = chatBotMessages[messageIndex].messageContent;
            } else if (["hayır", "yapmadım", "yapmdım", "yapmadim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("hayır");
              senderMessage = chatBotMessages[messageIndex].messageContent;
            } else {
              senderMessage =
                  "Dediğinizi anlayamadım.Evet veya Hayır der misiniz";
            }
            break;
          default:
        }
        chatBotLive.add(ChatMessage(message, MessageEnum.SENDER));
        chatBotLive.add(ChatMessage(senderMessage, MessageEnum.RECEIVER));
        controller.animateTo(180 * chatBotLive.length.toDouble(),
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      }
    });
  }

  List<ChatMessage> chatBotMessages = [
    ChatMessage(
        "Merhabalar! Uygulamaya hoşgeldin :) Konuşmaya hazır mısın? Eğer hazırsan bu soruya evet cevabını vererek başlayabilirsin.",
        MessageEnum.RECEIVER),
    ChatMessage(
        "Öncelikle adın ve soyadını öğrenebilir miyim?", MessageEnum.RECEIVER),
    ChatMessage("Peki cinsiyetin nedir?", MessageEnum.RECEIVER),
    ChatMessage("Askerliğini yaptın mı?", MessageEnum.RECEIVER),
    ChatMessage("Kaç yaşındasın?", MessageEnum.RECEIVER),
    ChatMessage("Nerede yaşıyorsun?", MessageEnum.RECEIVER),
    ChatMessage("Nerelisin?", MessageEnum.RECEIVER),

    ChatMessage(
        "Eğitim durumun nedir? (Lise mezunuyum, üniversite okuyorum vb.)",
        MessageEnum.RECEIVER),
    //Uni Mezun
    ChatMessage("Mezuniyet tarihin nedir?", MessageEnum.RECEIVER),
    ChatMessage("Hangi üniversiteden mezun oldun?", MessageEnum.RECEIVER),
    ChatMessage("Hangi bölümden mezun oldun?", MessageEnum.RECEIVER),
    ChatMessage("GNO puanını yazabilir misin?", MessageEnum.RECEIVER),
    //Uni Okuma
    ChatMessage("Hangi üniversitede okuyorsun?", MessageEnum.RECEIVER),
    ChatMessage("Hangi bölümde okuyorsun?", MessageEnum.RECEIVER),
    ChatMessage("Şu andaki GNO'n kaç?", MessageEnum.RECEIVER),

    //Çalışma durumu
    ChatMessage("Peki şu anda çalışıyor musun?", MessageEnum.RECEIVER),
    //1*Evet,çalışıyorum,calisiyorum
    ChatMessage("Hangi sektörde çalışmaktasın?", MessageEnum.RECEIVER),
    ChatMessage("Çalıştığın şirketin ismi nedir?", MessageEnum.RECEIVER),
    ChatMessage(
        "Bu şirkette ne kadar süredir çalışmaktasın?", MessageEnum.RECEIVER),
    ChatMessage("Bu işinizden önce başka bir deneyiminiz oldu mu?",
        MessageEnum.RECEIVER),
    //Evet,oldu
    ChatMessage("Hangi sektörde çalıştın?", MessageEnum.RECEIVER),
    ChatMessage("Hangi şirkette çalıştın?", MessageEnum.RECEIVER),
    ChatMessage("Ne kadar süre çalıştın?", MessageEnum.RECEIVER),
    //1*Hayır,çalışmıyorum
    ChatMessage("İlk defa mı çalışacaksınız?", MessageEnum.RECEIVER),
    //Hayır ise
    ChatMessage("Daha önce hangi sektörde çalıştın?", MessageEnum.RECEIVER),
    ChatMessage("Hangi şirkette çalıştın?", MessageEnum.RECEIVER),
    ChatMessage("Ne kadar süre çalıştın?", MessageEnum.RECEIVER),
    ChatMessage("Eski işinden ayrılma sebebin neydi?", MessageEnum.RECEIVER),
    ChatMessage(
        "Son olarak kaç yıllık tecrübeye sahipsin?", MessageEnum.RECEIVER),

    ChatMessage(
        "Hangi sektör/sektörlerde çalışmak istiyorsun?", MessageEnum.RECEIVER),
    ChatMessage(
        "Büyük bir şirketi mi yoksa daha özelleşmiş şirketleri tercih edersin?",
        MessageEnum.RECEIVER),
    ChatMessage(
        "Peki part time/staj ya da full time'dan hangisini arıyorsunuz?",
        MessageEnum.RECEIVER),
    ChatMessage("Uzaktan çalışmayı düşünüyor musunuz?", MessageEnum.RECEIVER),
    ChatMessage("Grup çalışmasına yatkınlığın var mı?", MessageEnum.RECEIVER),
    ChatMessage("Daha önce yurt dışına gittiniz mi?", MessageEnum.RECEIVER),
    //Evet,gittim
    ChatMessage(
        "Hangi dilleri biliyorsun ve seviyen ne?(Herhangi bir yabancı dil sınavına girdiysen puanın)",
        MessageEnum.RECEIVER),
    ChatMessage("İş konusunda en iyi olduğunu düşündüğün yetenekler neler?",
        MessageEnum.RECEIVER),
    ChatMessage(
        "Aylık maaş beklentin TL cinsinden nedir?", MessageEnum.RECEIVER),
    ChatMessage("En iyi 3 özelliğin nedir?", MessageEnum.RECEIVER),
    ChatMessage(
        "Kötü olduğunu düşündüğün 3 özelliğin nedir?", MessageEnum.RECEIVER),
    ChatMessage(
        "Halihazırda bulunduğun herhangi bir topluluk/ekip/dernek var mı?",
        MessageEnum.RECEIVER),
    //Evet
    ChatMessage(
        "Hangi topluluk/topluluklarda rol almaktasın?", MessageEnum.RECEIVER),
    //Hayır
    ChatMessage(
        "Daha önce bulunduğun herhangi bir topluluk var mı?Varsa isimlerini söyler misin?",
        MessageEnum.RECEIVER),
    //Tel
    ChatMessage("Size ulaşabilmemiz için telefon numaranızı yazar mısınız?",
        MessageEnum.RECEIVER),
    ChatMessage("Size ulaşabilmemiz için mailinizi yazar mısınız?",
        MessageEnum.RECEIVER),
    ChatMessage(
        "Bana zaman ayırdığın için çok teşekkür ederim! Bilgilerini kaydettik, sonraki aşamada bu bilgiler ışığında sana en uygun iş ilanlarını listeliyor olacağız! :)",
        MessageEnum.RECEIVER),
  ];
}
