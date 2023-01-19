import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class AddressAndLocation extends StatelessWidget {
  const AddressAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListLabel(label: StringKeys.location.tr, justLabel: true,),
               SizedBox(
                    height: SizeManager.h174,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeManager.r20),
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: const CameraPosition(target: LatLng(31.9522, 35.2332)),
                          compassEnabled: false,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          onTap: (pos) {},
                          onMapCreated: (GoogleMapController controller) {},
                        ),
                      ),
                    ),
                  ),
      ],
    );
  }
}