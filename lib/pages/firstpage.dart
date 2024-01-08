import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

List<ListItem> foodtype = [
  ListItem("Yum" ,"ยำ"),
   ListItem("TomYum" ,"ต้มยำ"),
    ListItem("Jandeaw" ,"จานเดียว"),
    ListItem("SomTom" ,"ส้มตำ"),
];

List<DropdownMenuItem<ListItem>> _dropdownMenuItems = [];

ListItem? _selectedItem;
List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
  List<ListItem> foodtype) {
    List<DropdownMenuItem<ListItem>> item = [];
    for (ListItem ft in foodtype){
      item.add(DropdownMenuItem(
        value: ft,
        child: Text(ft.name),
        )
        );

    }
    return item;
  }


  @override
  void initState() {
    super.initState();
    _dropdownMenuItems =
buildDropdownMenuItem(foodtype);
_selectedItem = _dropdownMenuItems[0].value;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab07 Dropdown"),
      ),
      body: Column(children: [
        Text("เลือกประเภทอาหาร"),
        DropdownButton(
          value: _selectedItem,
          items: _dropdownMenuItems, 
          onChanged: (value) {
            setState(() {
              _selectedItem = value!;
            });
          },)
      ],),
    );
  }
}

class ListItem {
String value;
String name;
ListItem(this.value, this.name);
}