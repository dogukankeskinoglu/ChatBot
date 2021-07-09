import 'package:f_chatbot/Candidate/CandidateChat/modelview/candidateChatViewModel.dart';
import 'package:f_chatbot/ProviderModel/chatbotModel.dart';
import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/enum/companyEnum.dart';
import 'package:f_chatbot/core/enum/companyType.dart';
import 'package:f_chatbot/core/enum/education.dart';
import 'package:f_chatbot/core/enum/jobType.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/messageEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/university.dart';
import 'package:f_chatbot/core/enum/universityDepartment.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CandidateChatView extends CandidateChatViewModel {
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    cMessage = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isDone ? null : buildAppBar(),
      body: isDone ? doneBodyColumn() : bodyColumn(),
    );
  }

  Column bodyColumn() {
    return Column(
      children: [chatContent(), userInteraction()],
    );
  }

  Column doneBodyColumn() {
    return Column(
      children: [chatContent(), nextButton()],
    );
  }

  ContainerButton nextButton() {
    return ContainerButton(
        containerOnpressed: finishConversition,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.finishConversition,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }

  Expanded userInteraction() {
    return Expanded(
      flex: 2,
      child: isInput
          ? Container(
              height: dynamicHeight(0.3),
              width: dynamicWidth(1),
              child: messageFormField())
          : buildDropDown(messageIndex),
    );
  }

  Expanded chatContent() {
    return Expanded(
      flex: 9,
      child: chatScrollView(),
    );
  }

  SingleChildScrollView chatScrollView() {
    return SingleChildScrollView(
      controller: controller,
      child: chatMessageListView(),
    );
  }

  ListView chatMessageListView() {
    return ListView.builder(
      itemCount: chatBotLive.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: chatAlign(index),
        );
      },
    );
  }

  Align chatAlign(int index) {
    return Align(
      alignment: (chatBotLive[index].messageType == MessageEnum.SENDER
          ? Alignment.topRight
          : Alignment.topLeft),
      child: chatContainer(index),
    );
  }

  Container chatContainer(int index) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (chatBotLive[index].messageType == MessageEnum.RECEIVER
              ? Colors.grey.shade200
              : Colors.blue[200]),
        ),
        padding: EdgeInsets.all(16),
        child: chatBotLive[index].messageContent);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Hoşgeldin"),
    );
  }

  Row buildDropDown(int messageIndex) {
    late final dropdownChild;
    print(messageIndex);
    switch (messageIndex) {
      case 5:
        dropdownChild = buildConsumerLocationCityDropDown();
        break;
      case 6:
        dropdownChild = buildConsumerBirthCityDropDown();
        break;
      case 7:
        dropdownChild = buildEducationDropDown();
        break;
      case 9:
        dropdownChild = buildConsumerUniversityDropDown();
        break;
      case 10:
        dropdownChild = buildConsumerUniversityDepartmentDropDown();
        break;
      case 12:
        dropdownChild = buildConsumerUniversityDropDown();
        break;
      case 13:
        dropdownChild = buildConsumerUniversityDepartmentDropDown();
        break;
      case 13:
        dropdownChild = buildConsumerUniversityDepartmentDropDown();
        break;
      case 16: //ÇalışılanSector
        dropdownChild = buildActiveSectorDropDown();
        break;
      case 17: //Çalışılan Şirket
        dropdownChild = buildActiveCompanyDropDown();
        break;
      case 20: //Önceden çalışılan Sector
        dropdownChild = buildPrevSectorDropDown();
        break;
      case 21: //Önceden çalışılan Şirket
        dropdownChild = buildPrevCompanyDropDown();
        break;
      case 24: //Önceden çalışılan Sector
        dropdownChild = buildPrevSectorDropDown();
        break;
      case 25: //Önceden çalışılan Şirket
        dropdownChild = buildPrevCompanyDropDown();
        break;
      case 29: //İstenilen Sektör
        dropdownChild = buildDesireSectorDropDown();
        break;
      case 30: //CompanyType
        dropdownChild = buildCompanyTypeDropDown();
        break;
      case 31: //Parttime
        dropdownChild = buildJobTypeDropDown();
        break;

      default:
    }
    return Row(
      children: [
        Expanded(
            flex: 9,
            child: dropdownChild), //messageIndex==5 ? Text("SA") : Text("s")),
        Expanded(
            flex: 1,
            child: GestureDetector(
              child: Icon(Icons.send),
              onTap: () => sendMessage(selectedSector),
            )),
      ],
    );
  }

  Widget buildEducationDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => educationDropDown(model),
    );
  }

  Widget educationDropDown(ChatBotModel cityobject) {
    return DropdownButton(
        value: cityobject.selectedEducationValue,
        items: EducationTypeEnum.values
            .map<DropdownMenuItem<String>>(
                (EducationTypeEnum value) => DropdownMenuItem<String>(
                      value: value.educationType,
                      child: Text(
                        value.educationType,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          cityobject.changeEducationValue(value.toString());
          selectedEducationValue = value.toString();
        });
  }

  Widget buildConsumerBirthCityDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => birthCityDropDown(model),
    );
  }

  Widget birthCityDropDown(ChatBotModel cityobject) {
    return DropdownButton(
        value: cityobject.selectedBirthCityValue,
        items: CityLocation.values
            .map<DropdownMenuItem<String>>(
                (CityLocation value) => DropdownMenuItem<String>(
                      value: value.cityName,
                      child: Text(
                        value.cityName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          cityobject.changeBirthCityValue(value.toString());
          selectedBirthCity = value.toString();
        });
  }

  Widget buildConsumerLocationCityDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => locationCityDropDown(model),
    );
  }

  Widget locationCityDropDown(ChatBotModel cityobject) {
    return DropdownButton(
        value: cityobject.selectedCityValue,
        items: CityLocation.values
            .map<DropdownMenuItem<String>>(
                (CityLocation value) => DropdownMenuItem<String>(
                      value: value.cityName,
                      child: Text(
                        value.cityName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          cityobject.changeCityValue(value.toString());
          selectedCityValue = value.toString();
        });
  }

  Widget buildConsumerUniversityDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => universityDropDown(model),
    );
  }

  Widget universityDropDown(ChatBotModel universityObject) {
    return DropdownButton(
        value: universityObject.selectedUniversity,
        items: UniversityEnum.values
            .map<DropdownMenuItem<String>>(
                (UniversityEnum value) => DropdownMenuItem<String>(
                      value: value.universityName,
                      child: Text(
                        value.universityName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          universityObject.changeUniversity(value.toString());
          selectedUniversity = value.toString();
        });
  }

  Widget buildConsumerUniversityDepartmentDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => universityDepartmentDropDown(model),
    );
  }

  Widget universityDepartmentDropDown(ChatBotModel universityDepartmentObject) {
    return DropdownButton(
        value: universityDepartmentObject.selectedUniversityDepartment,
        items: UniversityDepartmentEnum.values
            .map<DropdownMenuItem<String>>(
                (UniversityDepartmentEnum value) => DropdownMenuItem<String>(
                      value: value.universityDepartmentName,
                      child: Text(
                        value.universityDepartmentName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          universityDepartmentObject
              .changeUniversityDepartment(value.toString());
          selectedUniversityDepartment = value.toString();
        });
  }

  Widget buildActiveSectorDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => sectorDropDown(model),
    );
  }

  Widget sectorDropDown(ChatBotModel sectorObject) {
    return DropdownButton(
        value: sectorObject.selectedSector,
        items: SectorEnums.values
            .map<DropdownMenuItem<String>>(
                (SectorEnums value) => DropdownMenuItem<String>(
                      value: value.sectorText,
                      child: Text(
                        value.sectorText,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          sectorObject.changeSector(value.toString());
          selectedSector = value.toString();
        });
  }

  Widget buildActiveCompanyDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => activeCompanyDropDown(model),
    );
  }

  Widget activeCompanyDropDown(ChatBotModel activeCompanyObject) {
    return DropdownButton(
        value: activeCompanyObject.selectedCompany,
        items: CompanyEnum.values
            .map<DropdownMenuItem<String>>(
                (CompanyEnum value) => DropdownMenuItem<String>(
                      value: value.companyName,
                      child: Text(
                        value.companyName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          activeCompanyObject.changeCompany(value.toString());
          selectedCompany = value.toString();
        });
  }

  Widget buildPrevSectorDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => prevSectorDropDown(model),
    );
  }

  Widget prevSectorDropDown(ChatBotModel sectorObject) {
    return DropdownButton(
        value: sectorObject.selectedPrevSector,
        items: SectorEnums.values
            .map<DropdownMenuItem<String>>(
                (SectorEnums value) => DropdownMenuItem<String>(
                      value: value.sectorText,
                      child: Text(
                        value.sectorText,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          sectorObject.changePrevSector(value.toString());
          selectedPrevSector = value.toString();
        });
  }

  Widget buildPrevCompanyDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => prevCompanyDropDown(model),
    );
  }

  Widget prevCompanyDropDown(ChatBotModel prevCompanyObject) {
    return DropdownButton(
        value: prevCompanyObject.selectedPrevCompany,
        items: CompanyEnum.values
            .map<DropdownMenuItem<String>>(
                (CompanyEnum value) => DropdownMenuItem<String>(
                      value: value.companyName,
                      child: Text(
                        value.companyName,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          prevCompanyObject.changePrevCompany(value.toString());
          selectedPrevCompany = value.toString();
        });
  }

  Widget buildDesireSectorDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => desireSectorDropDown(model),
    );
  }

  Widget desireSectorDropDown(ChatBotModel sectorObject) {
    return DropdownButton(
        value: sectorObject.selectedDesireSector,
        items: SectorEnums.values
            .map<DropdownMenuItem<String>>(
                (SectorEnums value) => DropdownMenuItem<String>(
                      value: value.sectorText,
                      child: Text(
                        value.sectorText,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          sectorObject.changeDesireSector(value.toString());
          selectedDesireSector = value.toString();
        });
  }

  Widget buildCompanyTypeDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => companyTypeDropDown(model),
    );
  }

  Widget companyTypeDropDown(ChatBotModel companyType) {
    return DropdownButton(
        value: companyType.selectedCompanyType,
        items: CompanyTypeEnum.values
            .map<DropdownMenuItem<String>>(
                (CompanyTypeEnum value) => DropdownMenuItem<String>(
                      value: value.companyType,
                      child: Text(
                        value.companyType,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          companyType.changeCompanyType(value.toString());
          selectedCompanyType = value.toString();
        });
  }

  Widget buildJobTypeDropDown() {
    return Consumer<ChatBotModel>(
      builder: (context, model, child) => jobTypeDropDown(model),
    );
  }

  Widget jobTypeDropDown(ChatBotModel jobType) {
    return DropdownButton(
        value: jobType.selectedJobType,
        items: JobTypeEnum.values
            .map<DropdownMenuItem<String>>(
                (JobTypeEnum value) => DropdownMenuItem<String>(
                      value: value.jobType,
                      child: Text(
                        value.jobType,
                        textAlign: TextAlign.start,
                      ),
                    ))
            .toList(),
        onChanged: (value) {
          jobType.changeJobType(value.toString());
          selectedJobType = value.toString();
        });
  }

  TextFormField messageFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: cMessage,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: GestureDetector(
            child: Icon(Icons.send),
            onTap: () => sendMessage(cMessage.text),
          ),
          hintText: "Mesaj"),
    );
  }
}
