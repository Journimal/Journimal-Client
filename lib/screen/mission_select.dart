import 'package:flutter/material.dart';
import 'package:journimal_client/screen/mission_survey_1.dart';
import 'package:journimal_client/screen/mission_survey_2.dart';
import 'package:journimal_client/screen/mission_survey_3.dart';
import 'package:journimal_client/screen/mission_survey_4.dart';
import 'package:journimal_client/screen/mission_survey_5.dart';
import 'package:journimal_client/screen/mission_survey_6.dart';
import 'package:journimal_client/screen/mission_survey_7.dart';
import 'package:journimal_client/screen/mission_survey_8.dart';
import 'package:journimal_client/screen/mission_survey_9.dart';

class MissionSelectScreen extends StatefulWidget {
  const MissionSelectScreen({super.key});

  @override
  _MissionSelectScreenState createState() => _MissionSelectScreenState();
}

class _MissionSelectScreenState extends State<MissionSelectScreen> {
  List<Map<String, String>> selectedMissions = [];

  // Map missions to their respective survey screens
  final Map<String, Widget Function(BuildContext)> missionToScreen = {
    "Use a personal water bottle": (context) => MissionSurvey1Screen(),
    "Carry a reusable shopping bag": (context) => MissionSurvey2Screen(),
    "Turn off unnecessary electricity": (context) => MissionSurvey3Screen(),
    "Don't waste food": (context) => MissionSurvey4Screen(),
    "Travel on foot or by bicycle": (context) => MissionSurvey5Screen(),
    "Pick up small litter": (context) => MissionSurvey6Screen(),
    "Reuse hotel towels": (context) => MissionSurvey7Screen(),
    "Buy eco-friendly souvenirs": (context) => MissionSurvey8Screen(),
    "Go paperless": (context) => MissionSurvey9Screen(),
  };

  void toggleMission(String mission, String imagePath) {
    setState(() {
      final missionData = {'mission': mission, 'image': imagePath};
      if (selectedMissions.any((m) => m['mission'] == mission)) {
        selectedMissions.removeWhere((m) => m['mission'] == mission);
      } else if (selectedMissions.length < 2) {
        selectedMissions.add(missionData);
      }
    });
  }

  void navigateToMissionSurvey(String mission) {
    if (missionToScreen.containsKey(mission)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: missionToScreen[mission]!),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No survey screen available for $mission'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final missionImages = {
      "Use a personal water bottle":
          "assets/images/mission_thumbnail/m_th_1.png",
      "Carry a reusable shopping bag":
          "assets/images/mission_thumbnail/m_th_2.png",
      "Turn off unnecessary electricity":
          "assets/images/mission_thumbnail/m_th_3.png",
      "Don't waste food": "assets/images/mission_thumbnail/m_th_4.png",
      "Travel on foot or by bicycle":
          "assets/images/mission_thumbnail/m_th_5.png",
      "Pick up small litter": "assets/images/mission_thumbnail/m_th_6.png",
      "Reuse hotel towels": "assets/images/mission_thumbnail/m_th_7.png",
      "Buy eco-friendly souvenirs":
          "assets/images/mission_thumbnail/m_th_8.png",
      "Go paperless": "assets/images/mission_thumbnail/m_th_9.png",
    };

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(30.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Mission",
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Let's make your Eco-trip by choosing the mission you want.",
                    style: TextStyle(
                      color: Color(0xffB3B3B3),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffD9D9D9),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: selectedMissions.length > index
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      selectedMissions[index]['mission']!,
                                      style: const TextStyle(
                                        color: Color(0xff424242),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (selectedMissions.isNotEmpty) {
                                        // 현재 선택된 미션의 이름 가져오기
                                        String currentMission =
                                            selectedMissions[index]['mission']!;

                                        // 미션 이름에 따라 화면 이동 처리
                                        if (currentMission ==
                                            "Use a personal water bottle") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey1Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Carry a reusable shopping bag") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey2Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Turn off unnecessary electricity") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey3Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Don't waste food") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey4Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Travel on foot or by bicycle") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey5Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Pick up small litter") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey6Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Reuse hotel towels") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey7Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Buy eco-friendly souvenirs") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey8Screen()),
                                          );
                                        } else if (currentMission ==
                                            "Go paperless") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MissionSurvey9Screen()),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'No survey screen available for this mission'),
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please select a mission first!'),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff022169),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(56),
                                      ),
                                    ),
                                    child: const Text(
                                      "Certifying",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xffD9D9D9),
                                  size: 50,
                                ),
                              ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Column(
              children: missionImages.entries.map((entry) {
                final mission = entry.key;
                final imagePath = entry.value;
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        imagePath,
                        width: 68,
                        height: 68,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        mission,
                        style: const TextStyle(
                          color: Color(0xff424242),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => toggleMission(mission, imagePath),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: selectedMissions
                                  .any((m) => m['mission'] == mission)
                              ? const Color(0xffD9D9D9)
                              : const Color(0xff022169),
                        ),
                        child: Text(
                          selectedMissions.any((m) => m['mission'] == mission)
                              ? "Cancel"
                              : "Add",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xffD9D9D9),
                      thickness: 1,
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
