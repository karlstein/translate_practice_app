class TranslateModel {
  String? orig;
  String? trans;
  String? translit;

  TranslateModel({this.orig, this.trans, this.translit});

  TranslateModel.fromJson(data) {
    var dataList = data['sentences'] as List<dynamic>;

    orig = data['sentences'][0]['orig'];
    trans = data['sentences'][0]['trans'];
    translit = dataList.length == 2 ? data['sentences'][1]['translit'] : "";
  }
}
