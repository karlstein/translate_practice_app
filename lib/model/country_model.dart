import 'package:flutter/material.dart';

class CountryModel {
  String countryCode;
  String countryName;
  Widget countryFlag;

  CountryModel({
    required this.countryCode,
    required this.countryName,
    required this.countryFlag,
  });
}

List<CountryModel> countryList = [
  CountryModel(
    countryCode: "af",
    countryName: "Afrikaans",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/af.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "ga",
    countryName: "Irish",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/ie.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "id",
    countryName: "Indonesia",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/id.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "it",
    countryName: "Italian",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/it.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "ar",
    countryName: "Arabic",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/sa.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "ja",
    countryName: "Japanese",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/jp.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "az",
    countryName: "Azerbaijan",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/az.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "ko",
    countryName: "Korean",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/kr.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "de",
    countryName: "Germany",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/de.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "en",
    countryName: "English",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/gb-eng.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
  CountryModel(
    countryCode: "ru",
    countryName: "Russia",
    countryFlag: new Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Image.asset(
        'assets/flags/ru.png',
        fit: BoxFit.fill,
      ),
    ),
  ),
];
