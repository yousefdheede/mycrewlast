import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

import '../../../../../map/map.dart';

class CompanyAddress extends StatelessWidget {
  const CompanyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoSection(
      label: StringKeys.location,
      onPressed: () {},
      content: SizedBox(
        height: SizeManager.h174,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.r20),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:
                  const CameraPosition(target: LatLng(31.9522, 35.2332)),
              compassEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              onTap: (pos) {
                Get.to(() => const mymap());
              },
              onMapCreated: (GoogleMapController controller) {},
            ),
          ),
        ),
      ),
    );
  }
}
