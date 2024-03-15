import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';

class InfoUser extends StatefulWidget {
  const InfoUser({super.key});

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right:  10, bottom: 10),
      color: MyColors.infoUser,
      child: Row(children: [
        Container(
          width: MyConstants.avatarSize,
          height: MyConstants.avatarSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.primary,
              width: 1,
            ),
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage("assets/defaultAvatar.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: MyColors.premiumBackground,
                    ),
                    child: const Text(
                      MyConstants.premium,
                      style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontSize: MyConstants.mediumFontSize,
                        color: MyColors.premiumText,
                      ),
                    ),
                    
                  ),
                  const SizedBox( width:  5)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Trần Dương Gia Thịnh",
                    style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontSize: MyConstants.largeFontSize,
                        fontWeight: FontWeight.bold,
                        color: MyColors.headerText),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
