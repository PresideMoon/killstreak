import 'package:flutter/material.dart';
import 'package:killstreak/model/user_service.dart';
import 'package:killstreak/view/groups_page.dart';
import 'package:killstreak/view/my_stats_page.dart';
import 'package:killstreak/widgets/bottom_navigation.dart';
import 'package:killstreak/widgets/recent_games_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();
    User testUser = userService.getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Killstreak'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Text(
                'Hello ${testUser.username}!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const RecentGamesCarousel(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  MyGroupsButton(),
                  MyStatsButton(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentPage: 0,
        shortcut: true,
      ),
    );
  }
}

class MyStatsButton extends StatelessWidget {
  const MyStatsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyStatsPage(),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 3,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'resources/images/net.png',
                  height: 40,
                  width: 40,
                ),
                const Text(
                  "My Games",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyGroupsButton extends StatelessWidget {
  const MyGroupsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GroupPage(),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.width / 3,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.groups,
                size: 40,
              ),
              Text(
                "My Groups",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
