import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class MyTuple3 {
  final dynamic item1;
  final dynamic item2;
  final dynamic item3;
  MyTuple3(this.item1, this.item2, this.item3);
}

void start() async {
  print("1");

  String tokenTest = "1689241267162x903812884532513300";
  String tokenLive = "1687976863621x348621495749399600";

  String pIdTest = "1689859976791x114655392812236800";
  String pIdLive = "1685771716678x265965453065584640";

  bool useLive = false;

  var urlTest =
      "https://sidyum1.bubbleapps.io/version-test/api/1.1/wf/pi_listing_new?purchased_prgm_id=$pIdTest&api_token=$tokenTest";
  var urlLive =
      "https://sidyum1.bubbleapps.io/version-live/api/1.1/wf/pi_listing_new?purchased_prgm_id=$pIdLive&api_token=$tokenLive";

  var uri = Uri.parse(useLive ? urlLive : urlTest);
  var payload = <String, String>{};
  var headers = <String, String>{
    'Authorization': 'Bearer ${useLive ? tokenLive : tokenTest}',
  };

  print("2");

  var response = await http.post(uri, headers: headers, body: payload);
  var responseJson = jsonDecode(response.body);
  // print(responseJson);

  print("3");

  var today = DateTime.now();

  print("4");

  var dayDate = responseJson['response']["day_date"];
  var sessionId = responseJson['response']["session_id"];
  var routinesAll = responseJson['response']["routines_all"];
  var workoutNamesAll = responseJson['response']["workout_names"];

  int br = min(sessionId.length, routinesAll.length);
  int minLength = min(dayDate.length, br);

  print([
    "5",
    "dayDate length ${dayDate.length}",
    "sessionId length - ${sessionId.length}",
    "routinesAll length - ${routinesAll.length}",
    "routinesAll length - ${routinesAll.length}",
    "workouts length - ${workoutNamesAll.length}"
  ]);

  List<MyTuple3> zipped = List.generate(
      minLength, (i) => MyTuple3(dayDate[i], sessionId[i], routinesAll[i]));

  print("6");

  print("7");

  var groups = groupBy(zipped, (e) => e.item1);
  var startDate = DateFormat('EEEE, MMMM dd, yyyy')
      .parse(responseJson['response']['day_date'][0]);
  var previousDate = startDate;
  var previousWeekNumber = 0;
  var week = 1;
  var day = 1;
  var routine = 1;

  print("8");

  var result = {
    "status": responseJson['status'],
    "response": {
      "cover_image": responseJson['response']['cover_img'] ?? "",
      "headline": responseJson['response']['headline'],
      "desc": responseJson['response']['desc'],
      "start": responseJson['response']['start'],
      "end": responseJson['response']['end'] ?? "",
    }
  };

  result['response']['weeks'] = [];

  var russ = 0;

  for (var group in groups.entries) {
    var bb3 = group.key.toString();

    var dateParsed = DateFormat('EEEE, MMMM d, yyyy').parse(bb3);

    if (dateParsed.day != previousDate.day) {
      day += 1;
    }
    if (dateParsed.weekday == startDate.weekday &&
        dateParsed.day != startDate.day) {
      week += 1;
      day = 1;
    }
    if (dateParsed.weekday == startDate.weekday && day != 1) {
      week += 1;
    }
    if (dateParsed.weekday == startDate.weekday) {
      day = 1;
    }
    if (week != previousWeekNumber) {
      result['response']['weeks'].add({
        "name": 'week $week',
        "current_week": dateParsed.add(Duration(days: 6)).isAfter(today) &&
            dateParsed.isBefore(today),
        "start_time": bb3,
        "week_routines": []
      });
    }

    result['response']['weeks'][week - 1]['week_routines']
        .add({"name": bb3, "day_routines": []});

    russ += group.value.length;

    for (var item in group.value) {
      result['response']['weeks'][week - 1]['week_routines'][day - 1]
              ['day_routines']
          .add({"session_id": item.item2, "routine": item.item3});
    }

    routine += 1;
    previousWeekNumber = week;
    routine = 1;
  }

  // print(russ);
  print([
    result["response"]["weeks"].map((e) => e.keys).toList(),
    // jsonDecode(result["response"])
    // ["routines_all"]
  ]);
}
