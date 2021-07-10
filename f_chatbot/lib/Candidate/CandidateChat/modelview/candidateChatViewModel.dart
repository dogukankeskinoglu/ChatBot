import 'package:f_chatbot/Candidate/CandidateChat/model/chatMessage.dart';
import 'package:f_chatbot/Candidate/CandidateChat/view/candidateChat.dart';
import 'package:f_chatbot/Candidate/CandidateJob/view/candidateJob.dart';
import 'package:f_chatbot/core/base/base_statefull.dart';
import 'package:f_chatbot/core/controller/validator.dart';
import 'package:f_chatbot/core/enum/education.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/messageEnum.dart';
import 'package:f_chatbot/core/enum/companyEnum.dart';
import 'package:f_chatbot/core/enum/companyType.dart';
import 'package:f_chatbot/core/enum/jobType.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/university.dart';
import 'package:f_chatbot/core/enum/universityDepartment.dart';
import 'package:flutter/material.dart';

abstract class CandidateChatViewModel extends BaseStateFull<CandidateChat> {
  late final TextEditingController cMessage;
  late final ScrollController controller;
  String gno = "";
  String name = "";
  String selectedBirthCity = CityLocation.ADANA.cityName;
  String selectedCityValue = CityLocation.ADANA.cityName;
  String selectedEducationValue = EducationTypeEnum.LISANSAKTIF.educationType;
  String selectedDesireSector = SectorEnums.Yazilim.sectorText;
  String selectedSector = SectorEnums.Yazilim.sectorText;
  String selectedPrevSector = SectorEnums.Yazilim.sectorText;
  String selectedCompany = CompanyEnum.TRENDYOL.companyName;
  String selectedPrevCompany = CompanyEnum.TRENDYOL.companyName;
  String selectedCompanyType = CompanyTypeEnum.KUCUK.companyType;
  String selectedJobType = JobTypeEnum.PARTTIME.jobType;
  String selectedUniversity = UniversityEnum.EGE.universityName;
  String selectedUniversityDepartment =
      UniversityDepartmentEnum.COMPUTER.universityDepartmentName;
  var isDone = false;
  var isInput = true;
  List<ChatMessage> chatBotLive = [
    ChatMessage(
      Text(
          "Merhabalar! Uygulamaya hoşgeldin :) Konuşmaya hazır mısın? Eğer hazırsan bu soruya evet cevabını vererek başlayabilirsin."),
      MessageEnum.RECEIVER,
    )
  ];
  List<String> candidateAnswers = [];
  var messageIndex = 0;

  void finishConversition() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CandidateJob(candidateName: name)),
      );
    });
  }

  void sendMessage(String message) {
    setState(() {
      if (message != "") {
        cMessage.text = "";
        switch (messageIndex) {
          case 0: //Giriş
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "hazırım", "yes", "hazirim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 1: //Ad Soyad
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (message.split(" ").length == 2 ||
                message.split(" ").length == 3) {
              name = message.split(" ")[0];
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;

          case 2: //Cinsiyet
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["erkek", "kadın", "kız"].contains(message.toLowerCase())) {
              if (message.toLowerCase() == "erkek") {
                messageIndex += 1;
                candidateAnswers.add("Erkek");
              } else {
                candidateAnswers.add("Kadın");
                candidateAnswers.add("null");
                messageIndex += 2;
              }
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;

          case 3: //Askerlik
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yaptım", "yapdım", "yapmadim", "yaptim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("Evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else if (["hayır", "yapmadım", "yapmdım", "yapmadim"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("Hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 4: //Yaş
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              isInput = false;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 5: //Yaşanılan yer
            chatBotLive
                .add(ChatMessage(Text(selectedCityValue), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedCityValue);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            break;
          case 6: //Doğulan Yer
            chatBotLive
                .add(ChatMessage(Text(selectedBirthCity), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedBirthCity);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            break;
          case 7: //Education
            chatBotLive.add(
                ChatMessage(Text(selectedEducationValue), MessageEnum.SENDER));
            if (selectedEducationValue == "Üniversite okuyorum" ||
                selectedEducationValue == "Yüksek lisans yapıyorum" ||
                selectedEducationValue == "Doktara yapıyorum") {
              candidateAnswers.add(selectedEducationValue.toLowerCase());
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              messageIndex += 5;
              isInput = false;
            } else if (selectedEducationValue == "Üniversite mezunuyum" ||
                selectedEducationValue == "Yüksek Lisans " ||
                selectedEducationValue == "Doktara yaptım") {
              candidateAnswers.add(selectedEducationValue.toLowerCase());
              messageIndex += 1;
              isInput = true;
            } else {
              candidateAnswers.add(selectedEducationValue.toLowerCase());
              messageIndex += 22;
              isInput = false;
            }

            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));

            break;
          case 8: //Mezun Yılı
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = false;
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
              isInput = true;
            }

            break;
          case 9: //Mezun Uni
            chatBotLive
                .add(ChatMessage(Text(selectedUniversity), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedUniversity);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 10: //Department
            chatBotLive.add(ChatMessage(
                Text(selectedUniversityDepartment), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedUniversityDepartment);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 11: //GNO
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            var gnolist = message.split(".");
            if (gnolist.length == 2) {
              try {
                gno = message;
                messageIndex += 4;
                candidateAnswers.add("null");
                candidateAnswers.add("null");
                chatBotLive.add(ChatMessage(
                    Text(chatBotMessages[messageIndex][0]),
                    MessageEnum.RECEIVER));
              } on FormatException {
                chatBotLive.add(ChatMessage(
                    Text(chatBotMessages[messageIndex][1]),
                    MessageEnum.RECEIVER));
              }
            } else {
              chatBotLive.add(ChatMessage(
                  Text(
                      "GNO puanını tam halini yazmamışsın. Rica etsem 3.00 gibi formatta yazabilir misin ?"),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 12: //Aktif Uni
            chatBotLive
                .add(ChatMessage(Text(selectedUniversity), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedUniversity.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 13: //Aktif Uni Bolüm
            chatBotLive.add(ChatMessage(
                Text(selectedUniversityDepartment), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedUniversityDepartment.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 14: //Aktif GNO
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            var gnolist = message.split(".");
            if (gnolist.length == 2) {
              try {
                gno = message;
                messageIndex += 1;
                //candidateAnswers.add(message);
                chatBotLive.add(ChatMessage(
                    Text(chatBotMessages[messageIndex][0]),
                    MessageEnum.RECEIVER));
              } on FormatException {
                chatBotLive.add(ChatMessage(
                    Text(chatBotMessages[messageIndex][1]),
                    MessageEnum.RECEIVER));
              }
            } else {
              chatBotLive.add(ChatMessage(
                  Text(
                      "GNO puanını tam halini yazmamışsın. Rica etsem 3.00 gibi formatta yazabilir misin ?"),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 15: //Çalisma Durumu
            candidateAnswers.add(gno);
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if ([
              "evet",
              "yes",
              "calisiyorum",
              "calisiyom",
              "çalışıyorum",
              "çalisiyorum"
            ].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("çalışıyor");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = false;
            } else if ([
              "hayır",
              "hayir",
              "no",
              "calismiyorum",
              "calismiyom",
              "çalışmıyorum",
              "çalismiyorum"
            ].contains(message.toLowerCase())) {
              messageIndex += 8;
              isInput = true;
              candidateAnswers.add("çalışmıyor");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 16: //Çalışılan Sektör
            chatBotLive
                .add(ChatMessage(Text(selectedSector), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedSector);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 17: //Çalıştığın Şirket
            chatBotLive
                .add(ChatMessage(Text(selectedCompany), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedCompany);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 18: //Şirkette Çalışma Süresi
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 19: //Önceden çalışma
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if ([
              "oldu",
              "evet",
              "çalıştım",
              "çaliştim",
              "calistim",
              "yes",
              "evt"
            ].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("var");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = false;
            } else if ([
              "hayır",
              "no",
              "hyr",
              "çalışmadım",
              "çalişmadim",
              "calistim",
            ].contains(message.toLowerCase())) {
              messageIndex += 9;
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              candidateAnswers.add("null");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 20: //öNCEDEN ÇALIŞILAN sEKTÖR
            chatBotLive
                .add(ChatMessage(Text(selectedPrevSector), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedPrevSector.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 21: //Önceden Çalışılan Şirket
            chatBotLive.add(
                ChatMessage(Text(selectedPrevCompany), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedPrevCompany.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 22: //Önceki şirkette ne kadar çalıştın ?
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 6;
              isInput = true;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 23: //Çalışmayan Kısım
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["ilk", "evet", "yes"].contains(message.toLowerCase())) {
              messageIndex += 6;
              candidateAnswers.add("evet");

              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else if (["hayır", "hayir", "ilk değil"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("hayır");

              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = false;
            break;
          case 24: //öNCEDEN ÇALIŞILAN sEKTÖR
            chatBotLive
                .add(ChatMessage(Text(selectedPrevSector), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedPrevSector.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 25: //Önceden Çalışılan Şirket
            chatBotLive.add(
                ChatMessage(Text(selectedPrevCompany), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedPrevCompany.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 26: //Önceden Çalışma süren
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              isInput = true;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 27: //Önceki işinden ayrılma sebebi
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(message);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            break;
          case 28: //Kaç yıllık tecrübe
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              isInput = false;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 29: //İstenilen Sektör
            chatBotLive.add(
                ChatMessage(Text(selectedDesireSector), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedDesireSector.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 30: //CompanyType
            chatBotLive.add(
                ChatMessage(Text(selectedCompanyType), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedCompanyType.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = false;
            break;
          case 31: //Part time ?
            chatBotLive
                .add(ChatMessage(Text(selectedJobType), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(selectedJobType.toLowerCase());
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            isInput = true;
            break;
          case 32: //Uzaktan Çalışma
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yes", "istiyorum", "düsünüyorum", "düşünüyorum"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else if (["hayır", "düsünmüyorum", "no", "istemiyorum"]
                .contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 33: //Grup çalışması
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yes", "var"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else if (["hayır", "yok", "no"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 34: //Yurt dışına gittin mi
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yes", "var"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else if (["hayır", "yok", "no"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 35: //Dil
            bool isValid = true;
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            List<String> languages = message.split("*");
            for (var i = 0; i < languages.length; i++) {
              if (languages[i].split(",").length != 2) {
                isValid = false;
                break;
              }
            }

            if (isValid) {
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 36: //İş konusunda en iyi yetenekler
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (message.split(",").length >= 1) {
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 37: //Aylık Maaş
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              messageIndex += 1;
              candidateAnswers.add(message);
              isInput = true;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 38: //En iyi 3 özellik
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (message.split(",").length == 3) {
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 39: //En kötü 3 özellik
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (message.split(",").length == 3) {
              messageIndex += 1;
              candidateAnswers.add(message);
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            isInput = true;
            break;
          case 40: //Topluluk var mı
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yes", "var"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else if (["hayır", "yok", "no"].contains(message.toLowerCase())) {
              messageIndex += 2;
              candidateAnswers.add("hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 41: //Aktif olan topluluk
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(message);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            break;
          case 42: //En son çalışıyon Topluluk
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            if (["evet", "yes", "var", "evt"].contains(message.toLowerCase())) {
              messageIndex += 1;
              candidateAnswers.add("evet");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else if (["hayır", "yok", "no", "hyr", "hayir"]
                .contains(message.toLowerCase())) {
              messageIndex += 2;
              candidateAnswers.add("hayır");
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
              isInput = true;
            } else {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 43:
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            messageIndex += 1;
            candidateAnswers.add(message);
            chatBotLive.add(ChatMessage(
                Text(chatBotMessages[messageIndex][0]), MessageEnum.RECEIVER));
            break;
          case 44: //Telefon Numarası
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            try {
              int.parse(message);
              String? phoneValidatorMessage = isValidPhone(message);
              if (phoneValidatorMessage == null) {
                messageIndex += 1;
                candidateAnswers.add(message);
                isInput = true;
                chatBotLive.add(ChatMessage(
                    Text(chatBotMessages[messageIndex][0]),
                    MessageEnum.RECEIVER));
              } else {
                chatBotLive.add(ChatMessage(
                    Text(phoneValidatorMessage), MessageEnum.RECEIVER));
              }
            } on FormatException {
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][1]),
                  MessageEnum.RECEIVER));
            }
            break;
          case 45:
            chatBotLive.add(ChatMessage(Text(message), MessageEnum.SENDER));
            String? emailValidatorMessage = isValidateEmail(message);
            if (emailValidatorMessage == null) {
              messageIndex += 1;
              candidateAnswers.add(message);
              isInput = true;
              isDone = true;
              chatBotLive.add(ChatMessage(
                  Text(chatBotMessages[messageIndex][0]),
                  MessageEnum.RECEIVER));
            } else {
              chatBotLive.add(ChatMessage(
                  Text(emailValidatorMessage), MessageEnum.RECEIVER));
            }
            break;
          default:
        }

        controller.animateTo(180 * chatBotLive.length.toDouble(),
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      }
    });
  }

  List<List<String>> chatBotMessages = [
    [
      "Merhabalar! Uygulamaya hoşgeldin :) Konuşmaya hazır mısın? Eğer hazırsan bu soruya evet cevabını vererek başlayabilirsin.",
      "Sanırım hazır değilsin. İstersen biraz derin nefes al. Hazır olduğunda tekrardan hazırım diyebilirsin"
    ],
    [
      "Öncelikle adın ve soyadını öğrenebilir miyim?",
      "Sanırım birileri adını soyadını yazamamış. Sana biraz yardımcı olmak isterim. Örneğin: Burak YILDIZ şeklinde yazabilirsin :)"
    ],
    [
      "Peki cinsiyetin nedir?",
      "Sanırım cinsiyetini yanlış yazdın.Erkek/Kadın olacak şekilde tekrardan yazar mısın ?"
    ],
    [
      "Askerliğini yaptın mı?",
      "Dediğinizi anlayamadım.Evet veya Hayır der misiniz"
    ],
    [
      "Kaç yaşındasın?",
      "Sanırım cevabını rakam kullanmadan girdin. Tekrardan rakam ile yazma şansın var mı ?"
    ],
    ["Nerede yaşıyorsun?", "null"],
    ["Nerelisin?", "null"],
    [
      "Eğitim durumun nedir? (Lise mezunuyum], üniversite okuyorum vb.)",
      "null"
    ],
    [
      "Hangi senede mezun oldun?",
      "Mezuniyet tarihini doğru girdiğinden emin misin?"
    ],
    ["Hangi üniversiteden mezun oldun?", "null"],
    ["Hangi bölümden mezun oldun?", "null"],
    [
      "GNO puanını yazabilir misin?",
      "Rakamları kullanarak tekrardan yazar mısın?"
    ],
    ["Hangi üniversitede okuyorsun?", "null"],
    ["Hangi bölümde okuyorsun?", "null"],
    ["Şu andaki GNO'n kaç?", "Rakamları kullanarak tekrardan yazar mısın?"],
    [
      "Peki şu anda çalışıyor musun?",
      "Söylediğinizi anlayamadım. Kısa yanıt olarak evet veya hayır diyebilirsiniz"
    ],
    ["Hangi sektörde çalışmaktasın?", "null"],
    ["Çalıştığın şirketin ismi nedir?", "null"],
    [
      "Bu şirkette kaç aydır çalışmaktasın?",
      "Lütfen sayı cinsinden geçerli bir değer gir."
    ],
    [
      "Bu işinizden önce başka bir deneyiminiz oldu mu?",
      "Ne dediğini anlayamadım, evet veya hayır olarak cevaplayabilir misin?"
    ],
    ["Hangi sektörde çalıştın?", "null"],
    ["Hangi şirkette çalıştın?", "null"],
    [
      "Ne kadar süre (ay değerinden) çalıştın?",
      "Sanırım cevabını rakam kullanmadan girdin. Tekrardan rakam ile yazma şansın var mı ?"
    ],
    [
      "İlk defa mı çalışacaksınız?",
      "Ne dediğini anlayamadım, evet veya hayır olarak cevaplayabilir misin?"
    ],
    ["Daha önce hangi sektörde çalıştın?", "null"],
    ["Hangi şirkette çalıştın?", "null"],
    [
      "Ay olarak ne kadar süre çalıştın?",
      "Sanırım cevabını rakam kullanmadan girdin. Tekrardan rakam ile yazma şansın var mı ?"
    ],
    ["Eski işinden ayrılma sebebin neydi?", "null"],
    [
      "Son olarak kaç yıllık tecrübeye sahipsin?",
      "Sanırım cevabını rakam kullanmadan girdin. Tekrardan rakam ile yazma şansın var mı ?"
    ],
    ["Hangi sektör/sektörlerde çalışmak istiyorsun?", "null"],
    [
      "Büyük bir şirketi mi yoksa daha özelleşmiş şirketleri tercih edersin?",
      "null"
    ],
    ["Peki part time/staj ya da full time'dan hangisini arıyorsunuz?", "null"],
    [
      "Uzaktan çalışmayı düşünüyor musunuz?",
      "Ne dediğini anlayamadım, evet veya hayır olarak cevaplayabilir misin?"
    ],
    [
      "Grup çalışmasına yatkınlığın var mı?",
      "Ne dediğini anlayamadım, evet veya hayır olarak cevaplayabilir misin?"
    ],
    [
      "Daha önce yurt dışına gittiniz mi?",
      "Ne dediğini anlayamadım, evet veya hayır olarak cevaplayabilir misin?"
    ],
    [
      "Hangi dilleri biliyorsun ve seviyen ne?(Herhangi bir yabancı dil sınavına girdiysen puanın)",
      "Beklenenin dışında cevap verdiniz. Sanırım kendimi tam ifade edemedim. İpucu olarak YDS,80 şeklinde yazabilirsin."
    ],
    [
      "İş konusunda en iyi olduğunu düşündüğün yetenekler neler? Rica etsem aralarında virgül olacak şekilde yazar mısın?",
      "null"
    ],
    [
      "Aylık maaş beklentin TL cinsinden nedir?",
      "Hımm. Cevabına bakacak olursam en az bir tane harf kullanmışsın. Heyecan yapmadan tekrardan beklediğin maaşı yazar mısın ? :)"
    ],
    [
      "En iyi 3 özelliğin nedir? Bu soruyu cevaplarken iyi düşün. Biliyorum çok fazla iyi olduğun nokta var ama bize en dikkat çekebilecekleri lazım. Az kalsın unutuyordum. Özelliklerinin arasına virgül koyabilir misin",
      "Görüyorum ki 3 tane özellik yazmamışsın veya virgül koymayı unutmuşsun. Benden sana ipucu zeki,çalışkan,güvenilir"
    ],
    [
      "Kötü olduğunu düşündüğün 3 özelliğin nedir? Dürüst olman bizim için çok önemli.",
      "Görüyorum ki 3 tane özellik yazmamışsın veya virgül koymayı unutmuşsun. Benden sana ipucu tembel,sabırsız,inatçılı"
    ],
    [
      "Halihazırda bulunduğun herhangi bir topluluk/ekip/dernek var mı? Evet veya hayır demen bizim için yeterli. Sonlara doğru seni çok yormak istemiyorum",
      "Evet mi hayır mı tam anlayamadım?"
    ],
    ["Hangi topluluk/topluluklarda rol almaktasın?", "null"],
    [
      "Daha önce bulunduğun herhangi bir topluluk var mı?",
      "Evet mi hayır mı tam anlayamadım?"
    ],
    ["En son olduğun topluluğu yazar mısın", "null"],
    [
      "Size ulaşabilmemiz için telefon numaranızı yazar mısınız? 05******** şeklinde yazar mısın",
      "Beklediğim şekilde girmemişsin.Sadece rakamlardan oluşacak şekilde tekrardan yazabilir misin"
    ],
    [
      "Size ulaşabilmemiz için mailinizi yazar mısınız?",
      " Yazdığın email geçerli değil. Tekrardan yazar mısın?"
    ],
    [
      "Bana zaman ayırdığın için çok teşekkür ederim! Bilgilerini kaydettik, sonraki aşamada bu bilgiler ışığında sana en uygun iş ilanlarını listeliyor olacağız! :)"
    ],
  ];
}
