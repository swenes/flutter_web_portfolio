import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ymgk_web/pages/about_page.dart';
import 'package:ymgk_web/pages/education_page.dart';
import 'package:ymgk_web/pages/footer_page.dart';
import 'package:ymgk_web/pages/projects_page.dart';
import 'package:ymgk_web/pages/skill_page.dart';
import 'package:ymgk_web/pages/welcome_page.dart';
import 'package:ymgk_web/utils/globals.dart';
import 'package:ymgk_web/widgets/drawer_widget.dart';
import 'package:ymgk_web/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const WelcomePage(),
    const AboutPage(),
    const ProjectsPage(),
    const EducationPage(),
    const SkillPage(),
    const FooterPage(),
  ];

  final pageController = PageController(initialPage: 0);
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0.0,
          itemsScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];

            return page;
          },
        ),
      ),
    );
  }
}
