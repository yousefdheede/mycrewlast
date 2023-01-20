import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/about_us.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/address_and_location.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/contact_and_soical_media.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/open_positions_list.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const AppBackButton(),
        backgroundColor: ColorManager.instance.trnasparent,
        elevation: 0,
        surfaceTintColor: ColorManager.instance.trnasparent,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AppImageNetwork(
                height: SizeManager.h236,
              ),
              Container(
                height: SizeManager.h56,
                margin: EdgeInsets.all(SizeManager.w12),
                padding: EdgeInsets.all(SizeManager.w8),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(SizeManager.r12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Company name',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: SizeManager.w12, vertical: SizeManager.h12),
            children: [
              const AboutUs(),
              Divider(
                color: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.color
                    ?.withOpacity(0.5),
              ),
              const ContactAndSocialMedia(),
              Divider(
                color: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.color
                    ?.withOpacity(0.5),
              ),
              OpenPositionsList(),
              Divider(
                color: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.color
                    ?.withOpacity(0.5),
              ),
              const AddressAndLocation(),
              SizedBox(
                height: SizeManager.h4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
