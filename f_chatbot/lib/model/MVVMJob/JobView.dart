import 'package:f_chatbot/core/component/card/job_card.dart';
import 'package:f_chatbot/core/component/slidable/slidableWidget.dart';
import 'package:f_chatbot/core/enum/customOrder.dart';
import 'package:f_chatbot/core/localizate/application_string.dart';
import 'package:f_chatbot/model/MVVMJob/JobViewModel.dart';
import 'package:f_chatbot/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class JobView extends JobViewModel {
  TextEditingController text = TextEditingController();

  @override
  void initState() {
    super.initState();
    widgetOptions.add(buildBodyAllJobColumn());
    widgetOptions.add(buildBodyAllJobApply());
  }

  ListView buildBodyAllJobApply() {
    return ListView.builder(
      itemCount: jobListApply.length,
      itemBuilder: (context, index) => JobCardWidget(jobListApply[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: "Job",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Profile",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: bottomNavigatorFunc,
    );
  }

  void bottomNavigatorFunc(value) {
    setState(() {
      selectedIndex = value;
      if (selectedIndex == 1) {
        widgetOptions[1] = buildBodyAllJobApply();
      }
    });
  }

  Padding buildPadding() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: buildBodyAllJobColumn());
  }

  Column buildBodyAllJobColumn() {
    return Column(
      children: [
        Expanded(child: searchBar()),
        Expanded(child: buildDropdownButton()),
        Expanded(
          flex: 15,
          child: buildListView(),
        ),
      ],
    );
  }

  Widget buildSearch() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "Şirket Adı"),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selam Önder"),
          Text(ApplicationStrings.instance.jobPageTitle)
        ],
      ),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton(
        icon: Icon(Icons.arrow_downward_sharp),
        value: dropdownValue,
        items: <CustomOrderEnums>[
          CustomOrderEnums.tarih_artan,
          CustomOrderEnums.tarih_azalan,
          CustomOrderEnums.sirket_artan,
          CustomOrderEnums.sirket_azalan,
          CustomOrderEnums.puan_artan,
          CustomOrderEnums.puan_azalan,
        ].map<DropdownMenuItem<String>>((CustomOrderEnums value) {
          return DropdownMenuItem<String>(
            value: value.text,
            child: Text(value.text),
          );
        }).toList(),
        onChanged: (String? newValue) {
          print("O:$dropdownValue N:$newValue G:N");
          if (dropdownValue != newValue) {
            print("O:$dropdownValue N:$newValue G:E");
            CustomOrderEnums.values.forEach((element) {
              if (element.text == newValue) {
                orderByMatch(element);
              }
            });
            dropdownValue = newValue!;
            widgetOptions[0] = buildBodyAllJobColumn();
            setState(() {});
          }
        });
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          final item = jobList[index];
          return SlidableWidget(
              child: JobCardWidget(item),
              onDismissed: (action) =>
                  dismissSlidableItem(context, item, action));
        });
  }

  Widget searchBar() {
    return OutlineSearchBar(
      hintText: ApplicationStrings.instance.jobSearchTitle,
      textEditingController: text,
      onSearchButtonPressed: (value) {
        print(value);
      },
    );
  }
}
