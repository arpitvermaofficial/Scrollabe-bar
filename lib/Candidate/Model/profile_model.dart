class Profile_model {
  String name = "";
  String level = "";

  Profile_model({required this.name, required this.level});

  Profile_model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}
