import 'package:f_chatbot/ProviderModel/companyCreateModel.dart';
import 'package:f_chatbot/core/component/button/elevatedButton.dart';
import 'package:f_chatbot/core/component/dropdown/customdropdown.dart';
import 'package:f_chatbot/core/component/textFormField/customTextField.dart';
import 'package:f_chatbot/core/component/toast/toastmessage.dart';
import 'package:f_chatbot/core/enum/locationEnum.dart';
import 'package:f_chatbot/core/enum/sectorEnum.dart';
import 'package:f_chatbot/core/enum/validatorEnum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_format/date_time_format.dart';

class CompanyInformationPage extends StatelessWidget {
  TextEditingController companyName = TextEditingController();
  TextEditingController companyDescription = TextEditingController();
  TextEditingController companyTelephone = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyWebsite = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //Sektör

  @override
  Widget build(BuildContext context) {
    Size sizeContext = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return buildColumnButtonForm(context);
  }

  Column buildColumnButtonForm(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: buildForm(context),
        ),
        Expanded(
            child: CustomElevatedButton(
                onPressed: () {}, text: "Save Information"))
      ],
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: buildColumnInputText(context),
    );
  }

  Column buildColumnInputText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        nameTextInput(),
        descriptionTextInput(),
        telephoneTextInput(),
        emailTextInput(),
        webSiteTextInput(),
        Consumer<CompanyCreateModel>(
          builder: (context, model, child) => cityDropdown(model),
        ),
        Consumer<CompanyCreateModel>(
          builder: (context, model, child) => dateCard(context, model),
        ),
        Consumer<CompanyCreateModel>(
          builder: (context, model, child) => sectorDropDown(model),
        )
      ],
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
          subtitle: Text(model.selectedDate.format("d/m/Y")),
        ),
      ),
    );
  }

  CustomTextFormField webSiteTextInput() {
    return CustomTextFormField(
      textcontroller: companyWebsite,
      hinttext: "Sirketin website adresini giriniz",
      prefixIcon: Icon(Icons.web),
      keyboardType: TextInputType.url,
    );
  }

  CustomTextFormField emailTextInput() {
    return CustomTextFormField(
        textcontroller: companyEmail,
        hinttext: "Sirketin emailini giriniz",
        prefixIcon: Icon(Icons.email_outlined),
        keyboardType: TextInputType.emailAddress,
        validator: ValidatorEnums.EmailValidator);
  }

  CustomTextFormField telephoneTextInput() {
    return CustomTextFormField(
      textcontroller: companyTelephone,
      hinttext: "Sirketin telefonunu giriniz",
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
      textcontroller: companyDescription,
      hinttext: "Sirketin genel bilgisini giriniz",
      maxLines: 5,
      prefixIcon: Icon(Icons.description_sharp),
    );
  }

  CustomTextFormField nameTextInput() {
    return CustomTextFormField(
      textcontroller: companyName,
      hinttext: "Sirketinizin ismi giriniz",
      prefixIcon: Icon(Icons.account_balance_outlined),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Company Information"),
    );
  }
}
