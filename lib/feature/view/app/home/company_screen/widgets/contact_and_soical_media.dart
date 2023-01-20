import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/contact_item.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class ContactAndSocialMedia extends StatelessWidget {
  const ContactAndSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListLabel(
          label: StringKeys.contactAndSocialMedia.tr,
          justLabel: true,
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ContactItem(onPressed: (){}, icon: Icon(Icons.phone, color: Colors.blue.shade900,), title: StringKeys.phoneNumber.tr, subTitle: '+9725912345678',),
            SizedBox(height: SizeManager.h4,),
            ContactItem(onPressed: (){}, icon: Icon(Icons.email_outlined, color: Colors.blue.shade900,), title: StringKeys.email.tr, subTitle: 'email@example.com',),
            SizedBox(height: SizeManager.h4,),
            ContactItem(onPressed: (){}, icon: Icon(Icons.language_rounded, color: Colors.blue.shade900,), title: StringKeys.website.tr, subTitle: 'www.example.com',),
            SizedBox(height: SizeManager.h4,),
            ContactItem(onPressed: (){}, icon: Icon(Icons.facebook_rounded, color: Colors.blue.shade900,), title: StringKeys.facebook.tr, subTitle: 'example_account',),
            SizedBox(height: SizeManager.h4,),
            ContactItem(onPressed: (){}, icon: Icon(Icons.snapchat_rounded, color: Colors.blue.shade900,), title: StringKeys.snapchat.tr, subTitle: 'username',),
            SizedBox(height: SizeManager.h4,),
            ContactItem(onPressed: (){}, icon: Icon(Icons.location_on, color: Colors.blue.shade900,), title: StringKeys.address.tr, subTitle: 'Palestine Nablus',),
            ],
        ),
      ],
    );
  }
}
