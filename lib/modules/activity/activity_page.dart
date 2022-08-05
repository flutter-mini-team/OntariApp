import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../config/themes/app_color.dart';
import '../../constants/assets_path.dart';
import '../../widgets/stless/common_bodyitem.dart';
import '../../widgets/stless/common_button.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Activity', style: TxtStyle.titleActivity),
                          SquareButton(
                            bgColor: DarkTheme.greyScale800,
                            edge: 40,
                            radius: 10,
                            child: ImageIcon(
                              size: 13,
                              color: DarkTheme.white,
                              AssetImage(AssetPath.iconBell),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Container(
                        width: 327,
                        height: 357,
                        decoration: BoxDecoration(
                          color: DarkTheme.primaryBlue600,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                'Your Today\'s Progress\nAlmost Done!',
                                style: TxtStyle.headline2BoldWhite,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 15,
                              percent: 0.8,
                              animation: true,
                              animationDuration: 1000,
                              progressColor: DarkTheme.white,
                              backgroundColor: Colors.black.withOpacity(0.4),
                              circularStrokeCap: CircularStrokeCap.round,
                              center: const Text(
                                '80%',
                                style: TxtStyle.indicatorActivity,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: DarkTheme.primaryBlue900,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '16 ',
                                        style: TxtStyle.headline3SemiBoldWhite,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Completed',
                                            style: TxtStyle
                                                .headline4SemiBoldWhiteOpacity,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      child: VerticalDivider(
                                        width: 1,
                                        color: DarkTheme.white.withOpacity(0.2),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '4 ',
                                        style: TxtStyle.headline3SemiBoldWhite,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Uncompleted',
                                            style: TxtStyle
                                                .headline4SemiBoldWhiteOpacity,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TabBar(
                  tabs: const [
                    Tab(text: 'Incomplete'),
                    Tab(text: 'Complete'),
                  ],
                  labelColor: DarkTheme.primaryBlue600,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TxtStyle.headline4blue,
                  unselectedLabelColor: DarkTheme.greyScale500,
                  physics: const NeverScrollableScrollPhysics(),
                  unselectedLabelStyle: TxtStyle.headline4GreyTab,
                  indicatorColor: DarkTheme.primaryBlue600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
