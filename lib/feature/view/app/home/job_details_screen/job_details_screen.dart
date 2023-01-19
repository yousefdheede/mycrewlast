import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/home/company_screen/company_screen.dart';
import 'package:my_crew/feature/view/app/home/job_details_screen/widgets/dot_container.dart';
import 'package:my_crew/feature/view/app/home/job_details_screen/widgets/job_description_point.dart';
import 'package:my_crew/feature/view/app/home/job_details_screen/widgets/job_details_item.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

import '../../map/map.dart';

class JobDetailsScreen extends StatelessWidget {
  late jobdata jo;

  JobDetailsScreen(jobdata joblist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline_rounded,
                color: Theme.of(context).textTheme.headline1?.color,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeManager.w12, vertical: SizeManager.h16),
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeManager.w16, vertical: SizeManager.h16),
                  decoration: BoxDecoration(
                    // color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(SizeManager.r12),
                  ),
                  child: Column(
                    children: [
                      AppImageNetwork(
                        width: SizeManager.w60,
                        height: SizeManager.h60,
                        shape: BoxShape.circle,
                      ),
                      SizedBox(
                        height: SizeManager.h12,
                      ),
                      Text(
                        jo.job_title,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: SizeManager.h8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const CompanyScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeManager.h4),
                              child: Text(
                                jo.company,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontSize: FontSizeManager.fontSize14,
                                    ),
                              ),
                            ),
                          ),
                          const DotContainer(),
                          InkWell(
                            onTap: () {
                              Get.to(() => const mymap());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeManager.h4),
                              child: Text(
                                'Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontSize: FontSizeManager.fontSize14,
                                    ),
                              ),
                            ),
                          ),
                          /* Text('Address',
                               
                               style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: FontSizeManager.fontSize14),),*/
                          const DotContainer(),
                          Text(
                            jo.jobdate,
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontSize: FontSizeManager.fontSize14,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeManager.h20,
                ),
                SizedBox(
                  height: SizeManager.h110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      JobDetailsItem(
                          color: Colors.yellowAccent,
                          label: StringKeys.salary.tr,
                          value: jo.salary,
                          icon: Icons.monetization_on_outlined),
                      JobDetailsItem(
                          color: Colors.greenAccent,
                          label: StringKeys.jobType.tr,
                          value: jo.job_type,
                          icon: Icons.chair_outlined),
                      JobDetailsItem(
                          color: Colors.purpleAccent,
                          label: StringKeys.position.tr,
                          value: 'Senior',
                          icon: Icons.timer_outlined),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.color
                      ?.withOpacity(0.5),
                ),
                SizedBox(
                  height: SizeManager.h8,
                ),
                Text(
                  jo.job_Description,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeManager.h4,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => JobDiscriptionPoint(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: SizeManager.h8,
                  ),
                ),
                SizedBox(
                  height: SizeManager.h20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeManager.h12,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeManager.r16),
                        topRight: Radius.circular(SizeManager.r16)))),
            child: Text(StringKeys.applyNow.tr),
          )
          //  Padding(
          //    padding: EdgeInsets.all(SizeManager.w12),
          //    child: ElevatedButton(onPressed: (){}, child: Text(StringKeys.applyNow.tr)),
          //  )
        ],
      ),
    );
  }
}

class JobDetailsTabBar extends StatefulWidget {
  const JobDetailsTabBar({super.key});

  @override
  State<JobDetailsTabBar> createState() => _JobDetailsTabBarState();
}

class _JobDetailsTabBarState extends State<JobDetailsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late final jobdata jo;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: tabController,
            indicatorPadding: EdgeInsets.symmetric(vertical: SizeManager.h8),
            tabs: [
              Tab(
                text: jo.job_Description,
              ),
              Tab(
                text: jo.company,
              ),
              Tab(
                text: StringKeys.reviews.tr,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              Container(),
              Container(),
              Container(),
            ]),
          ),
        ],
      ),
    );
  }
}
