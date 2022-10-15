import 'package:intl/intl.dart';

class Patrol {
  String patrolId = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String leaderId = '';
  String leaderName = '';
  String location = '';
  var membersList = [];
  String members = '';
  String cadNumber = '';
  String userId = '';
  int bottleCount = 0;
  int peopleHelpedCount = 0;
  int peopleToSafetyCount = 0;
  int male = 0;
  int female = 0;
  int ageUpTo12 = 0;
  int age13To17 = 0;
  int age18To24 = 0;
  int age25AndOver = 0;
  int ethnicWhite = 0;
  int ethnicAfroCaribbean = 0;
  int ethnicAsian = 0;
  int ethnicEastEuropean = 0;

  Patrol({
    required DateTime startDate2,
    required DateTime endDate2,
    required String leaderId2,
    required String leaderName2,
    required String location2,
    required List<String> membersList2,
    required String members2,
    required String cadNumber2,
    required String userId2,
    int bottleCount2 = 0,
    int peopleHelpedCount2 = 0,
    int peopleToSafetyCount2 = 0,
    int male2 = 0,
    int female2 = 0,
    int ageUpToTwelve2 = 0,
    int ageThirteenToSeventeen2 = 0,
    int ageEighteenToTwentyFour2 = 0,
    int ageTwentyFiveAndOver2 = 0,
    int ethnicWhite2 = 0,
    int ethnicAfroCaribbean2 = 0,
    int ethnicAsian2 = 0,
    int ethnicEastEuropean2 = 0,
  }) {
    startDate = startDate2;
    endDate = endDate2;
    leaderId = leaderId2;
    leaderName = leaderName2;
    location = location2;
    membersList = membersList2;
    members = members2;
    cadNumber = cadNumber2;
    userId = userId2;
    bottleCount = bottleCount2;
    peopleHelpedCount = peopleHelpedCount2;
    peopleToSafetyCount = peopleToSafetyCount2;
    male = male2;
    female = female2;
    ageUpTo12 = ageUpToTwelve2;
    age13To17 = ageThirteenToSeventeen2;
    age18To24 = ageEighteenToTwentyFour2;
    age25AndOver = ageTwentyFiveAndOver2;
    ethnicWhite = ethnicWhite2;
    ethnicAfroCaribbean = ethnicAfroCaribbean2;
    ethnicAsian = ethnicAsian2;
    ethnicEastEuropean = ethnicEastEuropean2;
  }

  String getStartDate() {
    return DateFormat('dd/MM/yyyy').format(startDate);
  }

  String getEndDate() {
    return DateFormat('dd/MM/yyyy').format(startDate);
  }

  setLeaderName(String leaderName2) {
    leaderName = leaderName2;
  }

  setPatrolId(String patrolId2) {
    patrolId = patrolId2;
  }

  @override
  String toString() {
    String patrolAsString = patrolId;
    patrolAsString += " " + getStartDate();
    patrolAsString += " leader " + leaderName;
    patrolAsString += " location " + location;
    patrolAsString += " cad " + cadNumber;
    patrolAsString += " members " + members;
    patrolAsString += " bottle count " + bottleCount.toString();
    patrolAsString += " people helped " + peopleHelpedCount.toString();
    patrolAsString += " people to safety " + peopleToSafetyCount.toString();
    return patrolAsString;
  }
}
