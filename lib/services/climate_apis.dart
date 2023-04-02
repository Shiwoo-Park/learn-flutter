import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/carbon_deadline.dart';

class ClimateApiService {
  static const String climateClockBaseUrl = "https://api.climateclock.world";

  static Future<CarbonDeadline> getCarbonDeadline() async {
    CarbonDeadline deadline;
    Uri url = Uri.parse('$climateClockBaseUrl/v2/clock.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      Map<String, dynamic> deadlineMap =
          jsonMap['data']['modules']['carbon_deadline_1'];
      deadline = CarbonDeadline.fromJson(deadlineMap);
      print(deadline.timestamp);

      return deadline;
    }
    throw Error();
  }
}
