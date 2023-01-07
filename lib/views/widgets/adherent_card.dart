import 'package:flutter/material.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/style/text_style.dart';

class AdherentCard extends StatelessWidget {
  const AdherentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.screenHeight! * .15,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1.5, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(25)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColor.kSecondaryColor.withOpacity(0.7),
                AppColor.kPrimaryColor.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(25)),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth! * .04),
              child: SizedBox(
                height: SizeConfig.screenHeight! * .12,
                width: SizeConfig.screenWidth! * .3,
                child: Image.asset(
                  kAdherent,
                  fit: BoxFit.fill,
                  color: Colors.black,
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
                    "ADHERENT",
                    style: titleStyle(),
                  ),
                  subtitle: Text(
                    'je veux offrire un service',
                    style: subtitleStyle(),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
