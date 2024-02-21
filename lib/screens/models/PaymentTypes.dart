class PaymentTypes {
  String? id;
  String? name;
  String? iconName;
  String? value;

  PaymentTypes({this.id, this.name, this.iconName, this.value});

  PaymentTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconName = json['icon-name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['icon-name'] = iconName;
    data['value'] = value;
    return data;
  }
}
