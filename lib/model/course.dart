class Course {
  //attributes = fields in table
  int _id;
  String _name;
  String _content;

  Course(dynamic obj) {
    _id = obj['Id'];
    _name = obj['English'];
    _content = obj['Hindi'];
  }
  Course.fromMap(Map<String, dynamic> data) {
    _id = data['Id'];
    _name = data['English'];
    _content = data['Hindi'];
  }
  Map<String, dynamic> toMap() =>
      {'Id': _id, 'English': _name, 'Hindi': _content};

  int get id => _id;
  String get name => _name;
  String get content => _content;
}
