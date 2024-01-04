import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_management/constants/colors_theme.dart';
import 'package:student_management/constants/image_urls.dart';
import 'package:student_management/screens/archive_screen/widgets/evaluation_tab_widget.dart';
import 'package:student_management/screens/archive_screen/widgets/event_tab_widget.dart';
import 'package:student_management/screens/archive_screen/widgets/student_tab_widget.dart';
import 'package:student_management/screens/archive_screen/widgets/subject_tab_widget.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(216),
        child: AppBar(
          scrolledUnderElevation: 0,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 42),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 52, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: ColorsTheme.yellow),
                          ),
                          Text(
                            'Management',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: ColorsTheme.blue),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 52, right: 12),
                              primary: ColorsTheme.gray,
                              backgroundColor: ColorsTheme.light,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                    'Enter keyword to find out...',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: ColorsTheme.gray),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset(ImageUrls.searchIcon)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            primary: ColorsTheme.gray,
                            backgroundColor: ColorsTheme.light,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(42, 42),
                          ),
                          onPressed: () {},
                          child: SvgPicture.asset(
                            ImageUrls.filterIcon,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Positioned(
                    top: 0,
                    left: -16,
                    child: Image.asset(
                      ImageUrls.children,
                      width: 76,
                    ))
              ],
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            labelPadding: const EdgeInsets.symmetric(vertical: 8),
            indicatorPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(16),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: ColorsTheme.darkGray),
            labelColor: ColorsTheme.white,
            indicatorWeight: 0,
            dividerColor: Colors.white,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: ColorsTheme.blue,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: ColorsTheme.darkGray.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            tabs: const <Widget>[
              InkWell(
                child: Text(
                  'Students',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              InkWell(
                child: Text(
                  'Subject',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              InkWell(
                child: Text(
                  'Evaluation',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              InkWell(
                child: Text(
                  'Event',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          StudentTabWidget(),
          SubjectTabWidget(),
          EvaluationTabWidget(),
          EventTabWidget(),
        ],
      ),
    );
  }
}
