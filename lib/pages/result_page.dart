import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:translatepracticeapp/controllers/controller.dart';
import 'package:translatepracticeapp/model/country_model.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      endDrawer: Drawer(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Center(
                child: LoadingOverlay(
                  isLoading: c.isLoading.value,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 78,
                                  width: Get.width.toDouble() / 14 * 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0C288B),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 10),
                                        child: Icon(
                                          Icons.input,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Translate this",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => c.forwardAllResult(),
                              ),
                              Container(
                                width: Get.width.toDouble() / 14 * 7,
                                child: TextFormField(
                                  initialValue: c.sourceText.value,
                                  onChanged: (value) {
                                    c.stDuplicate.value = value;
                                  },
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)))),
                                  validator: (value) =>
                                      c.chooseValidator(value, c.sourceText),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "Translation Content",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          color: Color(0xFFF2F2F2),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                        Container(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: "${c.stDuplicate.value}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic)),
                                    TextSpan(text: "       in "),
                                    TextSpan(
                                        text:
                                            "${countryList.firstWhere((e) => e.countryCode == c.sl.value).countryName}"),
                                    TextSpan(text: " was"),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        c.jsonResult.value.length >= 1
                                            ? "${c.jsonResult.value[0].trans!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        c.jsonResult.value.length >= 1
                                            ? "${c.jsonResult.value[0].translit!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text("       in "),
                                  CountryDropdown(
                                    tl: c.tl1.value,
                                    onChanged: (String? value) =>
                                        c.onChangedDropdown(value, c.tl1),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        c.jsonResult.value.length >= 2
                                            ? "${c.jsonResult.value[1].trans!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        c.jsonResult.value.length >= 2
                                            ? "${c.jsonResult.value[1].translit!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text("       in "),
                                  CountryDropdown(
                                    tl: c.tl2.value,
                                    onChanged: (String? value) =>
                                        c.onChangedDropdown(value, c.tl2),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        c.jsonResult.value.length >= 3
                                            ? "${c.jsonResult.value[2].trans!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        c.jsonResult.value.length >= 3
                                            ? "${c.jsonResult.value[2].translit!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text("       in "),
                                  CountryDropdown(
                                    tl: c.tl3.value,
                                    onChanged: (String? value) =>
                                        c.onChangedDropdown(value, c.tl3),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        c.jsonResult.value.length >= 4
                                            ? "${c.jsonResult.value[3].trans!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        c.jsonResult.value.length >= 4
                                            ? "${c.jsonResult.value[3].translit!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text("       in "),
                                  CountryDropdown(
                                    tl: c.tl4.value,
                                    onChanged: (String? value) =>
                                        c.onChangedDropdown(value, c.tl4),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        c.jsonResult.value.length >= 5
                                            ? "${c.jsonResult.value[4].trans!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        c.jsonResult.value.length >= 5
                                            ? "${c.jsonResult.value[4].translit!}"
                                            : "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Text("       in "),
                                  CountryDropdown(
                                    tl: c.tl5.value,
                                    onChanged: (String? value) =>
                                        c.onChangedDropdown(value, c.tl5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({
    Key? key,
    required this.tl,
    required this.onChanged,
  }) : super(key: key);

  final String tl;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    var c = Get.find<AppController>();
    return DropdownButton<String>(
        value: countryList.firstWhere((e) => e.countryCode == tl).countryName,
        items: countryList
            .where((t) => t.countryCode != c.sl.value)
            .map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  padding: EdgeInsets.all(4),
                  height: 30 / 4 * 3,
                  width: 30,
                  child: e.countryFlag,
                ),
                Text(e.countryName),
              ],
            ),
            value: e.countryName,
          );
        }).toList(),
        onChanged: onChanged);
  }
}

// => tl =
// countryList.firstWhere((e) => e.countryName == value).countryCode
