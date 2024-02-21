class YearExpenses {
  String? totalExpended;
  List<Costs>? costs;

  YearExpenses({this.totalExpended, this.costs});

  YearExpenses.fromJson(Map<String, dynamic> json) {
    totalExpended = json['totalExpended'];
    if (json['costs'] != null) {
      costs = <Costs>[];
      json['costs'].forEach((v) {
        costs!.add(new Costs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalExpended'] = totalExpended;
    if (costs != null) {
      data['costs'] = costs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Costs {
  int? id;
  String? title;
  String? subtitle;
  String? icon;
  String? cost;
  String? date;

  Costs({this.id, this.title, this.subtitle, this.icon, this.cost, this.date});

  Costs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    icon = json['icon'];
    cost = json['cost'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['icon'] = icon;
    data['cost'] = cost;
    data['date'] = date;
    return data;
  }
}
