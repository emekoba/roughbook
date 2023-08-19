import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

void start() async {
  String jsonString =
      '{"routines_all": [            {                "day_1": {                    "date": "Monday July 24, 2023",                    "workout": {                        "name": "Cool down",                        "routines": [                            {                                "name": "Lunges",                                "duration": "31"                            }                        ]                    }                }            },            {                "day_1": {                    "date": "Monday, July 24, 2023",                    "workout": {                        "name": "Warmup",                        "routines": [                            {                                "name": "Lunges",                                "duration": "31"                            }                        ]                    }                }            },            {                "day_1": {                    "date": "Monday, July 24, 2023",                    "workout": {                        "name": "Core 1",                        "routines": [                            {                                "name":"Pushups",                                "duration": "60"                            }                        ]                    }                }            },            {                "day_3": {                    "date": "Wednesday, July 26, 2023",                    "workout": {                        "name": "Legs 1",                        "routines": [                            {                                "name": "Squats",                                "duration": ""                            },                            {                                "name": "Lunges",                                "duration": "31"                            }                        ]                    }                }            },            {                "day_3": {                    "date": "Wednesday, July 26, 2023",                    "workout": {                        "name": "warm up",                        "routines": [                            {                                "name": "Jumping jacks",                                "duration": "30"                         },                            {                                "name": "High knees",                                "duration": "60"                            }                        ]                    }                }            },            {                "day_3": {                    "date": "Wednesday, July 26, 2023",                    "workout": {                        "name": "Core 2",                        "routines": [                            {                                "name": "Burpees",                                "duration": "60"                            },                            {                                "name": "Pushups",                                "duration": "60"                            },                            {                                "name": "Jumping jacks",                                "duration": "30"                            }                        ]                    }                }            },            {                "day_5": {                    "date": "Friday, July 28, 2023",                    "workout": {                        "name": "Core 2",                        "routines": [                            {                                "name": "Burpees",                                "duration": "60"                            },                            {                                "name": "Pushups",                                "duration": "60"                            },                            {                                "name": "Jumping jacks",                                "duration": "30"                            }                        ]                    }                }            },            {                "day_5": {                    "date": "Friday, July 28, 2023",                    "workout": {                        "name": "legs 2",                        "routines": [                            {                                "name": "Right side lunges",                                "duration": "60"                            },                            {                                "name": "Left side lunges",                                "duration": "60"                            },                            {                                "name": "High knees",                                "duration": "60"                            }                        ]                    }                }            }        ]}'; // replace [...] with the full json structure

  String token = "1689706339075x560658870402547700";

  final response = await post(
    Uri.parse(
      "https://sidyum1.bubbleapps.io/version-test/api/1.1/wf/test_russell_copy_new?purchased_program_id=1689706339075x560658870402547700&api_token=$token",
    ),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    },
  );

  // var jsonString = jsonDecode(response.body);

  Map<String, dynamic> jsonObj = json.decode(response.body)["response"];

  // Initialize the transformed structure and a counters to track weeks and workouts
  Map<String, dynamic> newJsonObj = {'routines_all': []};
  int weekCounter = 1;
  Map<String, int> weekdayCounter = {};
  //  {'day_$i': ()}

  print(newJsonObj);
  inspect(newJsonObj);
  for (int i = 0; i <= 7; i++) {
    weekdayCounter.addAll({'day_$i': i});
  }

  String previousDayStr = "";

  // Process each day info in the original structure
  for (var dayInfo in jsonObj['routines_all']) {
    // Extract day number and day data
    String dayStr = dayInfo.keys.first;
    Map<String, dynamic> dayData = dayInfo[dayStr];
    int dayNum = int.parse(dayStr.split('_')[1]);

    // Start a new week if it's the first day or a day with a number less than the previous day number
    if ((newJsonObj['routines_all']).isEmpty ||
        dayNum < int.parse(previousDayStr.split('_')[1])) {
      newJsonObj['routines_all'].add({"week_$weekCounter": {}});
      weekCounter++;
    }

    // Add new workout info to the respective day
    weekdayCounter[dayStr] = weekdayCounter[dayStr]! + 1;

    int weekIndex = newJsonObj['routines_all'].length - 1;

    if (newJsonObj["routines_all"][weekIndex]["week_${weekCounter - 1}"]
            [dayStr] ==
        null) {
      newJsonObj["routines_all"][weekIndex]["week_${weekCounter - 1}"]
          [dayStr] = {"date": dayData["date"]};
    }

    (newJsonObj["routines_all"][weekIndex]["week_${weekCounter - 1}"][dayStr])
        .addAll({"workout_${weekdayCounter[dayStr]}": dayData["workout"]});

    previousDayStr = dayStr;
  }

  // print(json.encode(newJsonObj));
  print(newJsonObj);
}
