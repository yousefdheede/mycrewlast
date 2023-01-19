import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/company_profile_header.dart';
import 'package:my_crew/feature/view/app/widgets/choose_image_bottom_sheet.dart';
import 'package:my_crew/feature/view_model/company_profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';


class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyProfileViewModel>(
      builder: (_) {
        return Column(
                    children: [
                      const CompanyProfileHeader(),
                               SizedBox(
                height: SizeManager.h4,
              ),
              SizedBox(
                height: SizeManager.h34,
                width: SizeManager.w124,
                child: TextButton(
                    onPressed: () {
                       _.companyLogo != null ? _.saveCompanyLogo() :  Get.bottomSheet(
                                      ChooseImageBottomSheet(onCameraPressed: () {
                                        Get.back();
                                        _.pickImage(imageSource: ImageSource.camera);
                                      }, onGalleryPressed: () {
                                        Get.back();
                                        _.pickImage(imageSource: ImageSource.gallery);
                                      }),
                                      isScrollControlled: true);
                    },
                    child: Text(
                      _.companyLogo != null ? StringKeys.save.tr : StringKeys.changeLogo.tr,
                      style: TextStyle(fontSize: FontSizeManager.fontSize14),
                    )),
              ),
              
          ],
        );
      }
    );
  }
}