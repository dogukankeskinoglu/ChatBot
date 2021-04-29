import 'package:f_chatbot/core/component/card/job_card.dart';
import 'package:f_chatbot/model/MVVMJob/JobViewModel.dart';
import 'package:f_chatbot/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class JobView extends JobViewModel {
  String dropdownValue = "Tarihe göre azalan";
  Color colorCardIcon = Colors.blue;
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: buildBodyColumn()),
    );
  }

  Column buildBodyColumn() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: buildRowSearchAndOrder(),
        ),
        Expanded(
          flex: 9,
          child: buildListView(),
        ),
        //buildElevatedButton()
      ],
    );
  }

  Row buildRowSearchAndOrder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: searchBar()),
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
        children: [Text("Selam Önder"), Text("Senin İçin bunları buldum")],
      ),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton(
        hint: Row(
          children: [Text("Gelişmiş Sıralama")],
        ),
        icon: Icon(Icons.arrow_downward_sharp),
        value: dropdownValue,
        items: <String>[
          'Tarihe göre azalan',
          'Tarihe göre artan',
          'Domaine göre azalan',
          'Domaine göre artan'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        });
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        JobModel s = JobModel(
            "Machine Learning-Part Time",
            "DataBoss Security& Analytics A.Ş",
            "Ankara Turkey",
            "3 Gün Önce",
            "100");
        jobList.add(s);
        setState(() {});
      },
      child: Text("Tıklayınız"),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) => InkWell(
              child: checkCardSelected(index),
              onTap: () {
                selectedIndex.contains(index)
                    ? selectedIndex.remove(index)
                    : selectedIndex.add(index);
                setState(() {});
              },
            ));
  }

  JobCardWidget checkCardSelected(int index) {
    return JobCardWidget(jobList[index],
        selectedIndex.contains(index) ? Colors.red : Colors.grey);
  }

  Widget searchBar() {
    return OutlineSearchBar(
      hintText: "Şirketi giriniz",
      textEditingController: text,
      onSearchButtonPressed: (value) {
        print(value);
      },
    );
  }
}
