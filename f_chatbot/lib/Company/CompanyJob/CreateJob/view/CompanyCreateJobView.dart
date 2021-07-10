import 'package:f_chatbot/Company/CompanyHome/companyHome.dart';
import 'package:f_chatbot/Company/CompanyJob/CreateJob/modelview/CompanyCreateJobViewModel.dart';
import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/component/dropdown/customdropdown.dart';
import 'package:f_chatbot/core/component/textFormField/customTextField.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyCreateJobView extends CompanyCreateJobViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: buildPadding(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("İlan Oluştur"),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: buildColumnButtonForm(),
    );
  }

  Column buildColumnButtonForm() {
    return Column(
      children: [
        buildForm(),
        createJobButton(),
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: formKey,
      child: buildColumnInputText(),
    );
  }

  Column buildColumnInputText() {
    return Column(
      children: [
        jobTitleTextInput(),
        descriptionTextInput(),
        buildConsumerCityDropDown(),
        buildConsumerSectorDropDown(),
      ],
    );
  }

  Widget jobTitleTextInput() {
    return CustomTextFormField(
      padding: EdgeInsets.symmetric(vertical: 8),
      textcontroller: tcTitle,
      hinttext: "İlan Başlığı",
      validator: ValidatorEnums.EmptyValidator,
      prefixIcon: Icon(Icons.account_balance_outlined),
    );
  }

  Widget descriptionTextInput() {
    return CustomTextFormField(
      padding: EdgeInsets.symmetric(vertical: 8),
      textcontroller: tcDescription,
      hinttext: "İlan Tanımı",
      validator: ValidatorEnums.EmptyValidator,
      maxLines: 4,
      prefixIcon: Icon(Icons.description_sharp),
    );
  }

  ContainerButton createJobButton() {
    FocusManager.instance.primaryFocus?.unfocus();
    return ContainerButton(
        containerOnpressed: saveButton,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.createJob,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }

  Consumer<CompanyCreateModel> buildConsumerSectorDropDown() {
    return Consumer<CompanyCreateModel>(
      builder: (context, model, child) => sectorDropDown(model),
    );
  }

  Consumer<CompanyCreateModel> buildConsumerCityDropDown() {
    return Consumer<CompanyCreateModel>(
      builder: (context, model, child) => cityDropdown(model),
    );
  }

  Widget sectorDropDown(CompanyCreateModel cityobject) {
    return CustomDropDownItem(
        dropdownValue: cityobject.selectedSector,
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
        function: cityobject.changeSector);
  }

  Widget cityDropdown(CompanyCreateModel cityobject) {
    return CustomDropDownItem(
        dropdownValue: cityobject.selectedCityValue,
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
        function: cityobject.changeCityValue);
  }
}
