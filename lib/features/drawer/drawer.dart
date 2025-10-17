import 'package:catalyst/core/utils/assets.dart';
import 'package:catalyst/core/utils/routs.dart';
import 'package:catalyst/features/drawer/drawer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1B2330),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Logo / Title
              SizedBox(height:100,),
              SvgPicture.asset(Assets.catalyst,height: 35,),
              const SizedBox(height: 60),

              // 🔹 Drawer Items
              DrawerItem(
                icon: CupertinoIcons.person,
                label: "Profile",
                onTap: () {},
              ),
              DrawerItem(
                icon: CupertinoIcons.pen,
                label: "Auto Grade",
                onTap: () {
                  GoRouter.of(context).go(Routs.autoGrade);
                },
              ),
              DrawerItem(
                icon: CupertinoIcons.gear,
                label: "Settings",
                onTap: () {},
              ),
              DrawerItem(
                icon: CupertinoIcons.globe,
                label: "English",
                hasDropdown: true,
                onTap: () {},
              ),

              const Spacer(),

              // 🔹 Logout Button (optional)
              Divider(color: Colors.white24),
              DrawerItem(
                icon: CupertinoIcons.arrow_2_circlepath,
                label: "Logout",
                onTap: () {
                  GoRouter.of(context).go(Routs.login);
                },
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

