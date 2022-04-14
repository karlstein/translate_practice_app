import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translatepracticeapp/model/country_model.dart';
import 'package:translatepracticeapp/model/data_body_model.dart';
import 'package:translatepracticeapp/model/translate_model.dart';
import 'package:translatepracticeapp/service.dart';

class AppController extends GetxController {
  var jsonResult = <TranslateModel>[].obs;
  var chooseLangForm = GlobalKey<FormState>();
  var isLoading = false.obs;

  var sl = "id".obs;
  var sourceText = "Selamat Pagi".obs;
  var stDuplicate = "Selamat Pagi".obs;

  var tl1 = "de".obs;
  var tl2 = "ja".obs;
  var tl3 = "ko".obs;
  var tl4 = "ru".obs;
  var tl5 = "ar".obs;

  Services services = Services();

  chooseValidator(value, RxString tl) {
    if (value == null || value.isEmpty) {
      return "You should choose one of language available";
    }
    tl.value = value;
    return null;
  }

  forwardAllResult() async {
    jsonResult.value = [];
    await getResult(DataBodyModel(
      sourceText: sourceText.value,
      sourceLang: sl.value,
      targetLang: tl1.value,
    ));
    await getResult(DataBodyModel(
      sourceText: sourceText.value,
      sourceLang: sl.value,
      targetLang: tl2.value,
    ));
    await getResult(DataBodyModel(
      sourceText: sourceText.value,
      sourceLang: sl.value,
      targetLang: tl3.value,
    ));
    await getResult(DataBodyModel(
      sourceText: sourceText.value,
      sourceLang: sl.value,
      targetLang: tl4.value,
    ));
    await getResult(DataBodyModel(
      sourceText: sourceText.value,
      sourceLang: sl.value,
      targetLang: tl5.value,
    ));
    print("jsonResult controller: ${jsonResult.value[0]}");
  }

  getResult(DataBodyModel dataBody) async {
    try {
      var result = await services.translate(DataBodyModel(
          sourceLang: dataBody.sourceLang,
          targetLang: dataBody.targetLang,
          sourceText: dataBody.sourceText));
      if (result != null) {
        jsonResult.add(result);
      } else {
        print("null");
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<List<TranslateModel>?> translatedData(
  //     List<DataBodyModel> dataList) async {
  //   List<TranslateModel> dummy = [];
  //   for (var data in dataList) {
  //     try {
  //       var result = await services.translate(DataBodyModel(
  //           sourceLang: data.sourceLang,
  //           targetLang: data.targetLang,
  //           sourceText: data.sourceText));
  //       if (result != null) {
  //         dummy.add(result);
  //       } else {
  //         print("null");
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //     return dummy;
  //   }
  // }

  onChangedDropdown(value, RxString tl) {
    tl.value =
        countryList.firstWhere((e) => e.countryName == value).countryCode;
  }

  List<DropdownMenuItem> getCountryDropdownItems(List<CountryModel> countries) {
    List<DropdownMenuItem> dummy = [];
    for (var country in countries) {
      dummy.add(
        DropdownMenuItem(
          child: Row(
            children: [
              Container(
                child: country.countryFlag,
              ),
              Text("${country.countryName}"),
            ],
          ),
        ),
      );
    }

    return dummy;
  }

  @override
  void onInit() {
    forwardAllResult();
    super.onInit();
  }
}
