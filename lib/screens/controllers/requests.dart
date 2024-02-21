import 'package:finance_schedule/GlobalVars.dart';
import 'package:finance_schedule/screens/models/PaymentTypes.dart';
import 'package:finance_schedule/screens/models/YearExpenses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReqsController {
  var paymentTypes;
  var yearExpenses;

  getYears() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('$apiUrl/years'), headers: {
        'Content-type': 'application/json',
      });
      String source = const Utf8Decoder().convert(response.bodyBytes);
      var decodedResponse = json.decode(source) as List;
      if (decodedResponse.isNotEmpty) {
        if (decodedResponse.isNotEmpty) {
          return ({

            yearExpenses =
                decodedResponse.map((e) => YearExpenses.fromJson(e)).toList(),
          });
        }
      } else {
        return ({print(response.statusCode)});
      }
    } finally {
      client.close();
    }
  }

  getPaymenTypes() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('$apiUrl/payment-types'));
      String source = const Utf8Decoder().convert(response.bodyBytes);
      var decodedResponse = json.decode(source) as List;
      if (decodedResponse.isNotEmpty) {
        return ({
          paymentTypes = decodedResponse.map((e) => PaymentTypes.fromJson(e)).toList(),
        });
      } else {
        return ({print(response.statusCode)});
      }
    } finally {
      client.close();
    }
  }
  createNewCost() async{
    var client = http.Client();
    try{
      var response = await client.post(Uri.parse('$apiUrl/years'));
    }finally{
      client.close();
    }
  }
}
