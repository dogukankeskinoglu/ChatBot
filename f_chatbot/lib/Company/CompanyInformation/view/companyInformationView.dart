import 'package:f_chatbot/Company/CompanyHome/companyHome.dart';
import 'package:f_chatbot/Company/CompanyInformation/modelview/companyInformationViewModel.dart';
import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/core/component/button/containerButton.dart';
import 'package:f_chatbot/core/component/dropdown/customdropdown.dart';
import 'package:f_chatbot/core/component/textFormField/customTextField.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/loginEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/page/load_page/loadPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyInformationView extends CompanyInformationViewModel {
  @override
  Widget build(BuildContext context) {
    return informationState == UnauthenticatedEnum.FAIL
        ? Scaffold(appBar: buildAppBar(), body: buildPadding())
        : Scaffold(
            body: LoadPage(
                page: CompanyHome(
            companyName: 'Company',
          )));
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
        Expanded(flex: 20, child: SingleChildScrollView(child: buildForm())),
        Expanded(flex: 2, child: saveInformationButton()),
      ],
    );
  }

  ContainerButton saveInformationButton() {
    FocusManager.instance.primaryFocus?.unfocus();
    return ContainerButton(
        containerOnpressed: saveButton,
        containerColor: Colors.blue,
        containerText: ApplicationStrings.instance.saveInformation,
        containerHeightRate: 0.08,
        containerWidthRate: 1,
        containerRadius: 30);
  }

  Form buildForm() {
    return Form(
      key: formKey,
      child: buildColumnInputText(),
    );
  }

  Column buildColumnInputText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        nameTextInput(),
        descriptionTextInput(),
        telephoneTextInput(),
        emailTextInput(),
        webSiteTextInput(),
        buildConsumerCityDropDown(),
        buildConsumerSectorDropDown(),
        buildConsumerDate(),
      ],
    );
  }

  Consumer<CompanyCreateModel> buildConsumerSectorDropDown() {
    return Consumer<CompanyCreateModel>(
      builder: (context, model, child) => sectorDropDown(model),
    );
  }

  Consumer<CompanyCreateModel> buildConsumerDate() {
    return Consumer<CompanyCreateModel>(
      builder: (context, model, child) => dateCard(context, model),
    );
  }

  Consumer<CompanyCreateModel> buildConsumerCityDropDown() {
    return Consumer<CompanyCreateModel>(
      builder: (context, model, child) => cityDropdown(model),
    );
  }

  InkWell dateCard(BuildContext context, CompanyCreateModel model) {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDatePickerMode: DatePickerMode.year,
                initialDate: model.selectedDate,
                firstDate: DateTime(1950),
                lastDate: DateTime.now())
            .then((value) => model.changeDate(value));
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(child: Icon(Icons.date_range)),
          ),
          title: Text("Kuruluş tarihi seçmek için tıklayınız"),
          subtitle: Text(model.selectedDate.toString()),
        ),
      ),
    );
  }

  CustomTextFormField webSiteTextInput() {
    return CustomTextFormField(
      textcontroller: tcCmpanyWebsite,
      hinttext: "Sirket Website",
      prefixIcon: Icon(Icons.web),
      keyboardType: TextInputType.url,
    );
  }

  CustomTextFormField emailTextInput() {
    return CustomTextFormField(
        textcontroller: tcCompanyEmail,
        hinttext: "Sirket Email",
        prefixIcon: Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
        validator: ValidatorEnums.EmailValidator);
  }

  CustomTextFormField telephoneTextInput() {
    return CustomTextFormField(
      textcontroller: tcCompanyTelephone,
      hinttext: "Sirket Telefon",
      prefixIcon: Icon(Icons.phone),
      keyboardType: TextInputType.phone,
      validator: ValidatorEnums.PhoneValidator,
    );
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

  CustomTextFormField descriptionTextInput() {
    return CustomTextFormField(
      textcontroller: tcCompanyDescription,
      hinttext: "Sirket Bilgi",
      maxLines: 5,
      prefixIcon: Icon(Icons.description_sharp),
    );
  }

  CustomTextFormField nameTextInput() {
    return CustomTextFormField(
      textcontroller: tcCompanyName,
      hinttext: "Sirket İsmi",
      prefixIcon: Icon(Icons.account_balance_outlined),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Company Bilgileri"),
    );
  }
}
