import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 두 개의 탭: Mission, Eco-Buddies
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 2.0,
            backgroundColor: const Color(0xff022169),
            flexibleSpace: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    "assets/images/journimal_logo.png",
                    width: 180,
                    height: 22,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // 프로필 부분
            Container(
              color: const Color(0xffF5F5F5),
              padding: const EdgeInsets.fromLTRB(28, 48, 28, 24),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/profile.png",
                    width: 68,
                    height: 68,
                  ),
                  const SizedBox(width: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Kim-jihye",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.mode_edit_outline_outlined,
                        size: 16.0,
                        color: Color(0xff666666),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 통계 정보 부분 (카드 스타일 적용)
            Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Container(
                color: const Color(0xffF5F5F5), // 프로필 배경과 동일한 색
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard(
                      "0",
                      "TRIP",
                      Icon(
                        Icons.flight,
                        color: Color(0xff022169),
                      ),
                    ),
                    _buildStatCard(
                      "Koala",
                      "VU",
                      Image.asset("assets/images/koala.png"),
                    ),
                    _buildStatCard(
                      "0",
                      "Completed\n   Mission",
                      Icon(
                        Icons.language_outlined,
                        color: Color(0xff022169),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // TabBar와 TabBarView 추가
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: const Border(
                  bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: const TabBar(
                labelColor: Color(0xff022169),
                unselectedLabelColor: Color(0xff666666),
                indicatorColor: Color(0xff022169),
                tabs: [
                  Tab(text: "Current Mission"),
                  Tab(text: "My Eco-Buddies"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Current Mission Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/mission_thumbnail/m_th_1.png',
                            width: 68,
                            height: 68,
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            'Use a personal water bottle',
                            style: const TextStyle(
                              color: Color(0xff424242),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: const Color(0xff022169),
                            ),
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 45),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/mission_thumbnail/m_th_2.png',
                            width: 68,
                            height: 68,
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            'Carry a reusable shopping bag',
                            style: const TextStyle(
                              color: Color(0xff424242),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: const Color(0xff022169),
                            ),
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // My Eco-Buddies Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      // 스크롤 가능하도록 설정
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/animal_tear/tear_vu_koala.png",
                            width: 160,
                            height: 97,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Koala",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff022169),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              "The koala is an animal from Australia. \n"
                              "It lives in trees and eats eucalyptus leaves. \n"
                              "Koalas are Vulnerable (VU) because of habitat loss, climate change, and disease.",
                              textAlign: TextAlign.center, // 텍스트 가운데 정렬
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes_outlined),
              label: 'Mission',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My trip',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Info',
            ),
          ],
          selectedItemColor: const Color(0xff022169),
          unselectedItemColor: const Color(0xffD9D9D9),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  // 통계 카드 만드는 함수
  Widget _buildStatCard(String title, String subtitle, Widget icon) {
    return Container(
      width: 100,
      height: 130,
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xff022169)),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xff022169)),
          ),
        ],
      ),
    );
  }
}
