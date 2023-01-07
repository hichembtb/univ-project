import 'package:flutter/material.dart';
import 'package:si_coder/core/configuration/size_config.dart';
import '../../constant/colors/app_color.dart';
import '../../constant/style/text_style.dart';

class CustomPresent extends StatelessWidget {
  const CustomPresent(
      {super.key,
      required this.id,
      required this.name,
      required this.phone,
      required this.wilaya,
      required this.skill});
  final String id;
  final String name;
  final String phone;
  final String wilaya;
  final String skill;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.02),
      child: Container(
        height: SizeConfig.screenHeight! * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColor.kPresentCard.withOpacity(0.7),
            AppColor.kSecPresentCard.withOpacity(0.7)
          ]),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight! * .02),
                child: SizedBox(
                  width: SizeConfig.screenWidth! * .4,
                  child: ListTile(
                    title: Text(
                      name.toUpperCase(),
                      style: titleStyle(),
                    ),
                    subtitle: Text(
                      phone,
                      style: subtitleBlackStyle(),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight! * .02),
                child: SizedBox(
                  width: SizeConfig.screenWidth! * .4,
                  child: ListTile(
                    title: Text(
                      skill.toUpperCase(),
                      style: titleStyle(),
                    ),
                    subtitle: Text(
                      wilaya,
                      style: subtitleBlackStyle(),
                    ),
                  ),
                ),
              ),
            ]),
            Text(
              id,
              style: miniStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
