import 'package:flutter/material.dart';

import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/constant/style/text_style.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
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
                AppColor.kPrimaryColor.withOpacity(0.7),
                AppColor.kSecondaryColor.withOpacity(0.7)
              ]),
              borderRadius: BorderRadius.circular(25)),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * .03,
                  vertical: SizeConfig.screenHeight! * .02),
              child: SizedBox(
                width: SizeConfig.screenWidth! * .4,
                child: ListTile(
                  title: Text(
                    "CLIENT",
                    style: titleStyle(),
                  ),
                  subtitle: Text(
                    'je suis un client et je cherche un service',
                    style: subtitleStyle(),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth! * .04),
              child: SizedBox(
                height: SizeConfig.screenHeight! * .12,
                width: SizeConfig.screenWidth! * .3,
                child: Image.asset(
                  kClient,
                  fit: BoxFit.fill,
                  color: Colors.black,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
