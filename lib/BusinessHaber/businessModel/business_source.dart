// ignore_for_file: unnecessary_question_mark, prefer_void_to_null, dead_code, unnecessary_getters_setters

class BusinessSource {
  Null? _id;
  String? _name;

  BusinessSource({Null? id, String? name}) {
    if (id != null) {
    }
    if (name != null) {
      _name = name;
    }
  }

  Null? get id => _id;
  set id(Null? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;

  BusinessSource.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}